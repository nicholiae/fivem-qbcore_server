# FiveM Server Watermark Module

A simple watermark module for FiveM servers. Displays your server logo and opens an info menu when clicked.

## Quick Start

1. Copy the `fivem-watermark` folder to your server's `resources` directory
2. Add `ensure fivem-watermark` to your `server.cfg`
3. **Edit `html/index.html`** to change your server name, rules, and info
4. **Edit `html/style.css`** to change colors and styling
5. Replace `html/img/watermark.png` with your logo
6. Restart your server

## Customization

### Server Name & Info
Edit `html/index.html` - look for:
```html
<h1 id="server-name">Your Server Name</h1>
```

### Rules
Edit `html/index.html` - find the `<div class="rules-list">` section

### Colors & Styling
Edit `html/style.css` - change the CSS variables at the top:
```css
:root {
    --accent-color: #e94560;    /* Main highlight color */
    --bg-primary: rgba(20, 20, 30, 0.95);  /* Background */
    --text-primary: #ffffff;    /* Text color */
}
```

### Logo
Replace `html/img/watermark.png` with your own image (recommended: 512x512px PNG with transparency)

## Keybinds

- Press `PageUp` to open the server info menu
- Press `ESC` to close the menu

## File Structure

```
fivem-watermark/
├── fxmanifest.lua       # Resource manifest
├── client.lua           # Client script (don't need to edit)
└── html/
    ├── index.html       # EDIT THIS - Content & structure
    ├── style.css        # EDIT THIS - Colors & styling
    ├── script.js        # Menu behavior
    └── img/
        └── watermark.png  # Your server logo
```

## Exports

```lua
-- Toggle watermark visibility
exports['fivem-watermark']:toggleWatermark(true)  -- show
exports['fivem-watermark']:toggleWatermark(false) -- hide

-- Open/close menu
exports['fivem-watermark']:showMenu()
exports['fivem-watermark']:hideMenu()
```