#!/bin/bash

# Colors
RED="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;32m"
BOLDRED="\e[1;31m"
ENDCOLOR="\e[0m"

# Stop on errors
set -e

echo -e "${BOLDRED}Updating package list...${ENDCOLOR}"
sudo apt-get update -y

echo -e "${BOLDRED}Installing Git, curl, grep, and sed...${ENDCOLOR}"
sudo apt-get install -y git curl grep sed

# --- FETCH LATEST RELEASE TAG FROM GITHUB ---
echo -e "${BOLDRED}Retrieving latest Git Credential Manager release from GitHub...${ENDCOLOR}"
LATEST_VERSION=$(curl -s https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest \
    | grep '"tag_name":' \
    | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "$LATEST_VERSION" ]; then
  echo -e "${BOLDRED}Error: Could not retrieve the latest release version. Aborting.${ENDCOLOR}"
  exit 1
fi

echo -e "${GREEN}Latest GCM version found: ${LATEST_VERSION}${ENDCOLOR}"

# Convert "v2.6.1" to "2.6.1" for the .deb filename
DEB_FILE_VERSION="${LATEST_VERSION#v}"

DEB_FILE="gcm-linux_amd64.${DEB_FILE_VERSION}.deb"
DOWNLOAD_URL="https://github.com/git-ecosystem/git-credential-manager/releases/download/${LATEST_VERSION}/${DEB_FILE}"

echo -e "${BOLDRED}Downloading Git Credential Manager from:${ENDCOLOR} ${DOWNLOAD_URL}"
wget -q --show-progress "$DOWNLOAD_URL" -O "$DEB_FILE"

echo -e "${BOLDRED}Installing Git Credential Manager...${ENDCOLOR}"
sudo dpkg -i "$DEB_FILE" || sudo apt-get install -f -y

# Configure credential store to SecretService
# https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md#freedesktoporg-secret-service-api
git config --global credential.credentialStore secretservice

echo -e "${BOLDRED}Configuring Git Credential Manager...${ENDCOLOR}"
git-credential-manager configure

echo -e "${BOLDRED}Setting up Git Credential Manager for GitHub...${ENDCOLOR}"
git-credential-manager github login

echo -e "${BOLDGREEN}Installation complete.${ENDCOLOR}"
echo -e "${GREEN}------------------------------${ENDCOLOR}"
echo -e "${GREEN}To finalize the setup, you need to configure git with your username and email.${ENDCOLOR}"
echo -e "${GREEN}Run the following commands:${ENDCOLOR}"
echo -e "${GREEN}git config --global user.name 'Your Name'${ENDCOLOR}"
echo -e "${GREEN}git config --global user.email 'your@email.address'${ENDCOLOR}"
echo -e "${GREEN}------------------------------${ENDCOLOR}"

# Clean up
rm "$DEB_FILE"
