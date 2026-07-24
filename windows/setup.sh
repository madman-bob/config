#!/usr/bin/env bash

# Setup for Windows, using bash
# For WSL setup, use setup.sh in repository root directory

source setup_utils.sh

APPDATA="$(wslpath "$(wslvar APPDATA)")"

# Typora

echo "Installing Typora theme"
download_file "$APPDATA/Typora/themes/d42ker-github.css" https://raw.githubusercontent.com/l3ony2k/Typora-D42ker-Github-theme/main/d42ker-github.css

echo "Setting Typora preferences"
python typora/preferences.py "$APPDATA/Typora/profile.data"
