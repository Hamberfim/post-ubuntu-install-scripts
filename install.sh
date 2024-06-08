#!/bin/bash

# Ensure the script is run as the user
# Needed for all installers
sudo apt update && sudo apt upgrade -y
sudo apt install -y wget curl git unzip gpg apt-transport-https ca-certificates

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run each of the script installers # this path needs corrected
# shellcheck source=installer-scripts/*.sh
for script in installer-scripts/*.sh; do source "$script"; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade && sudo apt upgrade -y

# Revert idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 900
