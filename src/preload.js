/**
 * Preload script - runs in isolated context before web content loads
 * Provides secure bridge between Electron and web content
 */

const { contextBridge } = require('electron');

// Expose safe APIs to web content if needed
contextBridge.exposeInMainWorld('campaignTrail', {
  version: '1.0.0',
  offline: true
});
