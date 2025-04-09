#!/bin/bash
# Set up colors
RED="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;32m"
BOLDRED="\e[1;31m"
ENDCOLOR="\e[0m"


# Update
echo -e "${BOLDRED}Updating package list...${ENDCOLOR}"
sudo apt-get update -y
set -e  # Exit on any error

# Install git
echo -e "${BOLDRED}Installing Git...${ENDCOLOR}"
sudo apt-get install git -y

# Configuring Git to use the credential manager (Source: https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md#freedesktoporg-secret-service-api)

git config --global credential.credentialStore secretservice

# Installation URL 
# Source: https://github.com/git-ecosystem/git-credential-manager/releases/tag/v2.6.1
URL="https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb"

# Filename
DEB_FILE="gcm-linux_amd64.2.6.1.deb"

# Download the .deb package
echo -e "${BOLDRED}Downloading Git Credential Manager...${ENDCOLOR}"
wget -q --show-progress "$URL" -O "$DEB_FILE"

# Install the .deb package
echo -e "${BOLDRED}Installing Git Credential Manager...${ENDCOLOR}"
sudo dpkg -i "$DEB_FILE" || sudo apt-get install -f -y

# Configure Git Credential Manager
echo -e "${BOLDRED}Configuring Git Credential Manager...${ENDCOLOR}"
git-credential-manager configure

# Set up Git Credential Manager for GitHub
echo -e "${BOLDRED}Setting up Git Credential Manager for GitHub...${ENDCOLOR}"
git-credential-manager github login


echo -e "${BOLDGREEN}Installation complete.${ENDCOLOR}"
echo -e "${GREEN}------------------------------${ENDCOLOR}"
echo -e "${GREEN}To finalize the setup, you need to configure git with your username and email.${ENDCOLOR}"
echo -e "${GREEN}Run the following commands:${ENDCOLOR}"
echo -e "${GREEN}git config --global user.name 'Your Name'${ENDCOLOR}"
echo -e "${GREEN}git config --global user.email 'your@email.adress'${ENDCOLOR}"
echo -e "${GREEN}------------------------------${ENDCOLOR}"
# Clean up
rm "$DEB_FILE"