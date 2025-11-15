const { app, BrowserWindow, Menu, session } = require('electron');
const express = require('express');
const path = require('path');
const net = require('net');

let mainWindow;
let server;

// Disable GPU acceleration early to avoid errors in some environments
app.disableHardwareAcceleration();

/**
 * Find an available port
 */
function findAvailablePort(startPort = 8000, maxAttempts = 50) {
  return new Promise((resolve, reject) => {
    let currentPort = startPort;
    let attempts = 0;

    const tryPort = () => {
      if (attempts >= maxAttempts) {
        reject(new Error(`Could not find available port after ${maxAttempts} attempts`));
        return;
      }

      const server = net.createServer();
      server.once('error', () => {
        server.close();
        currentPort++;
        attempts++;
        process.nextTick(tryPort);
      });

      server.once('listening', () => {
        server.close();
        resolve(currentPort);
      });

      server.listen(currentPort, 'localhost');
    };

    tryPort();
  });
}

/**
 * Start Express server serving the offline CTS website
 */
async function startServer() {
  const expressApp = express();
  const baseDir = path.join(__dirname, '..', 'campaign-trail-showcase.github.io-offline');

  // Serve static files from the offline website directory
  expressApp.use(express.static(baseDir));

  // Fallback to index.html for SPA routing
  expressApp.get('*', (req, res) => {
    res.sendFile(path.join(baseDir, 'index.html'));
  });

  // Find an available port (start at 8000)
  const port = await findAvailablePort(8000);

  return new Promise((resolve, reject) => {
    server = expressApp.listen(port, 'localhost', () => {
      console.log(`Campaign Trail server running at http://localhost:${port}`);
      resolve(port);
    }).on('error', reject);
  });
}

/**
 * Create the main application window
 */
async function createWindow() {
  try {
    const port = await startServer();

    mainWindow = new BrowserWindow({
      width: 1024,
      height: 768,
      minWidth: 800,
      minHeight: 600,
      webPreferences: {
        preload: path.join(__dirname, 'preload.js'),
        nodeIntegration: false,
        contextIsolation: true,
        enableRemoteModule: false,
        sandbox: true
      },
      icon: path.join(__dirname, '..', 'assets', 'icon.png')
    });

    // Load the app
    mainWindow.loadURL(`http://localhost:${port}`);

    // Open DevTools in development mode
    // mainWindow.webContents.openDevTools();

    // Handle window closed
    mainWindow.on('closed', () => {
      mainWindow = null;
    });

  } catch (error) {
    console.error('Failed to start server:', error);
    app.quit();
  }
}

/**
 * Cleanup and shutdown
 */
function shutdown() {
  if (server) {
    server.close(() => {
      console.log('Server closed');
      app.quit();
    });
  } else {
    app.quit();
  }
}

/**
 * App event handlers
 */
app.on('ready', createWindow);

app.on('window-all-closed', () => {
  // On macOS, keep app running until explicitly quit
  if (process.platform !== 'darwin') {
    shutdown();
  }
});

app.on('activate', () => {
  // On macOS, re-create window when dock icon is clicked
  if (mainWindow === null) {
    createWindow();
  }
});

app.on('before-quit', () => {
  if (server) {
    server.close();
  }
});

// Simple menu
const createMenu = () => {
  const template = [
    {
      label: 'File',
      submenu: [
        {
          label: 'Exit',
          accelerator: 'CmdOrCtrl+Q',
          click: shutdown
        }
      ]
    },
    {
      label: 'View',
      submenu: [
        { role: 'reload' },
        { role: 'forceReload' },
        { role: 'toggleDevTools' }
      ]
    },
    {
      label: 'About',
      submenu: [
        {
          label: 'Campaign Trail Online 0.2',
          enabled: false
        }
      ]
    }
  ];

  Menu.setApplicationMenu(Menu.buildFromTemplate(template));
};

app.on('ready', createMenu);
