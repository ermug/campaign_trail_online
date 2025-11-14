# Campaign Trail Online - Offline Edition

An offline, OSA-compliant bundle of **Campaign Trail Showcase**, a political simulation game. Provides access for British users affected by the Online Safety Act's blocking of Imgur-hosted content.

## Overview

Campaign Trail Showcase is a political simulation game that allows players to attempt to win presidential elections by stepping into the shoes of various candidates. This project provides an offline version with all assets bundled locally.

### Why This Project?

The original Campaign Trail Showcase website relies on external resources (particularly Imgur-hosted images) that are blocked in the UK under the Online Safety Act (OSA). This project solves that by:

- 📦 **All assets local** - Images and resources bundled offline with no external links
- 🔒 **OSA compliant** - No Imgur links, no external tracking, no analytics
- 💾 **Internet preservation** - Archives the game for long-term offline access

Inspired by the Reddit post: https://www.reddit.com/r/thecampaigntrail/comments/1ov7u8c/cts_offline_edition_first_release_american_carnage

## Project Structure

```
campaign_trail_online/
├── README.md                                    # This file
├── start-tct.cmd                                # Launcher script
└── campaign-trail-showcase.github.io-offline/   # Offline website content
    ├── campaign-trail/                          # Game interface
    │   └── index.html                          # Entry point (Google Analytics removed)
    ├── static/                                 # Assets and code
    │   ├── js/                                 # Game scripts
    │   ├── json/                               # Game data
    │   ├── images/                             # Local images
    │   └── css/                                # Stylesheets
    └── resources/                              # Additional resources
```

## Features

- ✅ **Fully Offline** - Works without internet connection
- ✅ **OSA Compliant** - No Imgur links, no blocked content
- ✅ **Simple Launcher** - One-click batch script to start

## Getting Started

### Quick Start

1. **Windows Users**: Simply run `start-tct.cmd`
   - If you have Python 3 installed, it will use that
   - Otherwise, it will try Node.js (`npx http-server`)
   - Browser will open automatically to `http://localhost:8000`

2. **Manual Start** (any platform):
   ```bash
   cd campaign-trail-showcase.github.io-offline
   python -m http.server 8000
   # Then open browser to http://localhost:8000
   ```

### Requirements

One of the following:
- **Python 3.6+** (recommended)
- **Node.js** with npm

### Usage

1. Run the launcher script or start the server manually
2. The game interface loads at `localhost:8000`
3. Select an election year or mod from the menu
4. Play through the campaign scenario
5. Close the window or server to exit

## Modifications from Original

Minimal modifications to ensure offline and OSA compliance:

1. **Google Analytics Removed** - Eliminates external tracking calls
2. **All Assets Localized** - No external image links (all local files)

The original CTS code remains untouched.

## OSA Compliance

This project ensures compliance with the UK Online Safety Act by:

- ❌ **No Imgur links** - All images are local files in `/static/images/`
- ❌ **No external tracking** - Google Analytics removed
- ❌ **No CDN dependencies** - All required assets are bundled
- ❌ **No external API calls** - Completely self-contained

## Technical Details

- **Framework**: Static HTML/CSS/JavaScript
- **Game Engine**: Campaign Trail codebase (original)
- **Data**: JSON files
- **Server**: Python's built-in `http.server` or Node.js `http-server`

## Current State

**v1.0 (Current)**
- ✅ Offline bundle with one scenario
- ✅ Simple shell script launcher
- ✅ OSA-compliant (no external links)
- ✅ Works on Windows (Python or Node.js required)

**Future Plans**
- Desktop application wrapper (Electron/Tauri)
- Single .exe deployment
- Additional scenarios
- Launcher UI

## Credits

- **Campaign Trail Showcase**: Original CTS developers
- **The Campaign Trail**: Original game by Dan Bryan
- **Reddit Community**: Offline edition concept inspiration

## License

This project preserves and packages the Campaign Trail Showcase website as-is. The contents unique to this project are licensed under the GNU Affero General Public License v3.0

## Disclaimer

This is a preservation and accessibility project for offline use. It is not affiliated with the original Campaign Trail developers. All original code and content rights belong to their respective creators.
