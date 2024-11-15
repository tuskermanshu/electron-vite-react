#!/bin/bash

# Add permission for desktop shortcut
if [ -f /usr/share/applications/${productName}.desktop ]; then
    chmod +x /usr/share/applications/${productName}.desktop
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database
fi

# Add application to system menu
if command -v xdg-desktop-menu >/dev/null 2>&1; then
    xdg-desktop-menu install /usr/share/applications/${productName}.desktop
fi