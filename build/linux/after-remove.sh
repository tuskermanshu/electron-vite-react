#!/bin/bash

# Clean up application data if exists
if [ -d /opt/${productName} ]; then
    rm -rf /opt/${productName}
fi

# Remove desktop shortcut
if [ -f /usr/share/applications/${productName}.desktop ]; then
    rm -f /usr/share/applications/${productName}.desktop
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database
fi