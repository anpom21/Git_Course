# Git Credential Manager (GCM) Installation Script

This repository contains a simple bash script that installs and configures the Git Credential Manager on Linux. **Use it at your own risk and responsibility.** The script automates fetching the `.deb` package from the [official Git Credential Manager releases](https://github.com/git-ecosystem/git-credential-manager/releases) and performs the required configuration steps for GitHub.

---

## Overview

- **Script Name:** `install_gcm.sh`  
- **Purpose:** Automatically install and configure Git Credential Manager (GCM) on Linux systems.  
- **Tested On:** Ubuntu 22.04, Ubuntu 24.04
- **Script Last Updated:** April 10, 2025  
- **GCM Version:** 2.6.1

> **Disclaimer:**  
> This script is provided "as is" without warranty of any kind. You assume full responsibility for any possible issues arising from its usage (including, but not limited to, damage to your system or data). Always review scripts you run on your system.

---

## Prerequisites

- **sudo** privileges on your Linux system (specifically tested on Ubuntu 22.04 and 24.04).
- An internet connection to download the `.deb` file.

---

## Installation

1. **Download the script** (e.g., `install_gcm.sh`) and make it executable:

   ```bash
   chmod +x install_gcm.sh
    ```
2. **Run the script** with sudo or as root:

    ```bash
    sudo ./install_gcm.sh
    ```

Provide your GitHub credentials when prompted. Git Credential Manager will handle your tokens and secure authentication.


## Usage

Once the script completes, you can confirm Git Credential Manager is working by performing Git operations that require authentication (e.g., cloning a private repository). You should see prompts provided by Git Credential Manager instead of the default Git credential prompts.
## Configuring Git

To fully leverage the benefits of Git Credential Manager, ensure you have set up your Git user name and email (if you haven’t already):


    git config --global user.name "Your Name"
    git config --global user.email "your@email.address"



## Cleanup

The script automatically removes the downloaded .deb file to keep your system clean.

## Support & Responsibility

- This script is unofficial and not affiliated with the official Git Credential Manager or GitHub.
- Use it at your own responsibility. Any potential risks, including system or data damage, rest entirely on the user.
- For more information, refer to: 
    - [GCM Official installation](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)

