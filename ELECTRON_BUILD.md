# Building the Electron App

## Prerequisites

- Node.js 16+ and npm (https://nodejs.org/)
- Git

## Development Setup

```bash
# Install dependencies
npm install

# Run in development mode (with hot reload)
npm start

# Or for development with debugging
npm run dev
```

## Building for Distribution

```bash
# Build for Windows (creates .exe installer and portable version)
npm run build-win

# Build for all platforms (Windows, Mac, Linux)
npm run build-all
```

Output files will be in the `dist/` folder:
- `Campaign Trail Online.exe` - NSIS installer
- `CampaignTrailOnline.exe` - Portable executable (recommended for USB distribution)

## How It Works

1. Electron launches and starts an Express server
2. Server automatically finds an available port (default 8000)
3. Electron window opens and loads the local server
4. Campaign Trail Showcase runs completely offline
5. When you close the window, the server stops automatically

## Requirements for End Users

**Windows**: Just run the .exe - no additional software needed

The Electron executable bundles Chromium and Node.js, so users don't need to install anything else.

## File Structure

```
src/
  main.js      - Electron main process (server startup, window creation)
  preload.js   - Security layer between Electron and web content

campaign-trail-showcase.github.io-offline/
  - All game content and assets (served by Express)

package.json
  - Project metadata and build configuration
```

## Troubleshooting

**App won't start:**
- Check that port 8000 is available
- Try running `npm install` again
- Ensure you're in the project directory

**Server port already in use:**
- The app automatically finds a free port if 8000 is taken
- Check `console.log` in dev tools to see which port is being used

**Building fails:**
- Delete `node_modules` and `dist` folders
- Run `npm install` again
- Try `npm run build-win` again
