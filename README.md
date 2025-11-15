# Campaign Trail Online - Version 0.2

## Overview

Campaign Trail Online v0.2 is an offline, OSA-compliant desktop application featuring Campaign Trail Showcase. This initial release bundles the game with a complete offline infrastructure, allowing British users and others to play without restrictions.

Based on this reddit post: https://www.reddit.com/r/thecampaigntrail/comments/1ov7u8c/cts_offline_edition_first_release_american_carnage
## What's Included in v0.2

- ✅ **Campaign Trail Showcase** - Political simulation game, now in offline format
- ✅ **"American Carnage" Scenario** - The inaugural scenario for this offline edition
- ✅ **Complete Offline Bundle** - All assets, images, and data files included locally
- ✅ **Desktop Application** - Standalone .exe with embedded server and browser
- ✅ **Local Achievement System** - Track your accomplishments between sessions

## Key Features

- 📦 **Fully Self-Contained** - No internet connection required
- 🔒 **OSA Compliant** - No Imgur links or external blocked content
- 🖥️ **Simple One-Click Launch** - Just run the .exe
- 💾 **Data Persistence** - Cookies and achievements saved locally
- ⚙️ **Minimal Requirements** - No dependencies to install

## How to Use

1. **Download** `CampaignTrailOnline.exe`
2. **Run** the executable
3. **Play** - The game launches in a dedicated window
4. **Exit** - Close the window to shut down

That's it! The app handles all server management automatically.

## Technical Details

- **Built with:** Electron + Express.js
- **Platform:** Windows 64-bit
- **Size:** ~1.5 GB Uncopmpressed
- **Storage Location:** Achievement data stored in `%APPDATA%\CampaignTrailOnline\`

## Future Versions

**Coming Soon:**
- Additional mods will be added to the app in future updates

The modular design allows new content to be easily integrated. Users will be able to access new scenarios as updates are released.

## Current Limitations

- v0.2 includes one scenario ("American Carnage")
- Additional mods/scenarios will be added in future versions
- Windows only (for now)

## Launching Alternatives

**Option 1: Electron App (Recommended)**
- Run `CampaignTrailOnline.exe` directly
- No setup required

## Troubleshooting

**App won't launch:**
- Try running as Administrator
- Ensure your antivirus isn't blocking the executable
- Check that port 8000 (or nearby) is available

**Achievements not saving:**
- Check that `%APPDATA%\CampaignTrailOnline\` is writable
- Try restarting the app

**Performance issues:**
- The app requires ~200MB RAM when running
- Close other applications if experiencing lag

## Credits

- **Campaign Trail Showcase** - Original CTS developers
- **The Campaign Trail** - Original game by Dan Bryan
- **Reddit Community** - Offline edition concept and inspiration

## License

This project preserves and packages Campaign Trail Showcase for offline use. All original code and content rights belong to their respective creators. However, the unique components of this application are licensed under the GNU AFFERO GENERAL PUBLIC LICENSE

## Support

For issues specific to Campaign Trail Showcase gameplay, refer to the original project documentation.

For issues with the offline desktop app packaging, check the main repository documentation.

---

**Version:** 0.2  
**Release Date:** November 14 2025  
**Status:** Stable

This is version 0.2 of the Campaign Trail Online offline desktop application. Future versions will expand the content library and enhance the user experience.
