#!/bin/bash

echo -e "\U0001f680 Installing DevOps Apps..."

# Prevent self-deletion if running from inside the folder
if [ "$(pwd)" = "$HOME/devops-apps" ]; then
    echo -e "\U0001f6A8 Warning: Running from ~/devops-apps — moving to home directory"
    cd ~ || exit 1
fi

# Install dependencies
echo -e "\U0001f527 Installing required packages..."
sudo apt update
sudo apt install -y git zenity xterm

# Remove old version safely
if [ -d "$HOME/devops-apps" ]; then
    echo -e "\U0001f5D1 Removing old version..."
    rm -rf "$HOME/devops-apps"
fi

# Clone repo
echo -e "\U0001f4BE Cloning latest version from GitHub..."
git clone https://github.com/sunildata/devops-apps.git  "$HOME/devops-apps"

# Make all scripts executable
chmod +x "$HOME/devops-apps"/*
find "$HOME/devops-apps/categories"/* -type d -exec chmod +x {} \;
find "$HOME/devops-apps/categories"/* -type f -exec chmod +x {} \;

# Run internal setup script
echo -e "\U0001f39F Running internal setup..."
"$HOME/devops-apps/install"

echo -e "\U0001f389 DevOps Apps installed successfully!"
echo -e "\U0001f4CC You can now launch it from the desktop shortcut or run:"
echo "   ~/devops-apps/gui"
