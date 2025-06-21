#!/bin/bash

echo "🚀 Installing DevOps Apps..."

# Install dependencies
echo "🔧 Installing required packages..."
sudo apt update
sudo apt install -y git zenity xterm

# Clone repo
cd ~
rm -rf ~/devops-apps
git clone https://github.com/YOUR_USERNAME/devops-apps.git 

# Make all scripts executable
chmod +x ~/devops-apps/*
find ~/devops-apps/categories/* -type d -exec chmod +x {} \;
find ~/devops-apps/categories/* -type f -exec chmod +x {} \;

# Run the internal install script
~/devops-apps/install

echo "🎉 DevOps Apps installed successfully!"
echo "📌 You can now launch it from the desktop shortcut or run:"
echo "   ~/devops-apps/gui"
