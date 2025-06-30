# Minecraft Bedrock Server Upgrade

A robust Bash script to safely upgrade your Minecraft Bedrock server with minimal downtime. This tool automatically backs up your existing server, preserves essential configuration files and worlds, and seamlessly deploys the latest Bedrock server release. Perfect for server admins who value reliability and simplicity.

## About This Project

This project was created from start to finish with the help of generative AI (GitHub Copilot and GPT-4).  
From scripting to documentation, every step leveraged the power of modern AI tools to accelerate development and improve quality.  
If you’re curious about how AI can supercharge your own projects, feel free to reach out!

## Features

- **Automated Backups:** Creates a timestamped backup of your current server before upgrading.
- **Config Preservation:** Keeps your `allowlist.json`, `permissions.json`, `server.properties`, and `worlds` directory intact.
- **Minimal Downtime:** Stops the server, upgrades, and restarts it automatically.
- **Easy to Use:** Single-command upgrade process.

## Supported Platforms

This script is designed and tested for **Minecraft Bedrock servers running on Ubuntu Linux**.  
It may work on other Linux distributions with Bash, but Ubuntu is the recommended and supported environment.

## Prerequisites

- Linux environment with Bash
- [screen](https://www.gnu.org/software/screen/) installed
- [unzip](https://linux.die.net/man/1/unzip) installed
- Minecraft Bedrock server already set up in `~/bedrock`
- The upgrade script (`upgrade_bedrock.sh`) in your working directory

## Usage

1. **Download the Latest Bedrock Server ZIP**

   Get the latest Bedrock server ZIP from [Mojang's official site](https://www.minecraft.net/en-us/download/server/bedrock).

2. **Run the Upgrade Script**

   ```bash
   chmod +x upgrade_bedrock.sh
   ./upgrade_bedrock.sh /path/to/bedrock-server-<version>.zip
   ```

   Replace `/path/to/bedrock-server-<version>.zip` with the path to your downloaded ZIP file.

3. **What the Script Does**

   - Stops the running Bedrock server (if running in a `screen` session named `bedrock`)
   - Backs up your current server to a timestamped directory (e.g., `~/bedrock_backup_20240630_123456`)
   - Extracts the new server files to a temporary directory
   - Preserves your configuration files and worlds
   - Replaces the old server files with the new ones
   - Cleans up temporary files
   - Restarts the server in a new `screen` session

## Example

```bash
./upgrade_bedrock.sh ~/Downloads/bedrock-server-1.20.0.1.zip
```

## Notes

- The script assumes your server is located at `~/bedrock`.
- The script uses a `screen` session named `bedrock` to manage the server process.
- Always verify your backup before proceeding with major upgrades.

## Troubleshooting

- **Permission Denied:**  
  Make sure the script is executable:  
  `chmod +x upgrade_bedrock.sh`

- **Missing Dependencies:**  
  Install `screen` and `unzip` if not already installed:  
  ```bash
  sudo apt update
  sudo apt install screen unzip
  ```

- **Custom Server Directory:**  
  Edit the `SERVER_DIR` variable in the script if your server is not in `~/bedrock`.

## Contributing

We welcome and encourage community contributions!

If you have ideas for improvements, bug fixes, or new features, please open an issue or submit a pull request. Whether you’re a seasoned developer or just getting started, your input is valuable.

### How to Contribute

1. **Check Existing Issues:**  
   Look at the [issues page](https://github.com/hooligeek/MinecraftBedrockServerUpgrade/issues) to see if your idea or bug has already been discussed.

2. **Open a New Issue:**  
   If your idea or bug isn’t listed, open a new issue with as much detail as possible.

3. **Fork the Repository:**  
   Click “Fork” at the top right of this page to create your own copy of the project.

4. **Create a Branch:**  
   Create a new branch for your changes:
   ```bash
   git checkout -b my-feature-branch
   ```

5. **Make Your Changes:**  
   Add your improvements or fixes.

6. **Commit and Push:**  
   ```bash
   git add .
   git commit -m "Describe your changes"
   git push origin my-feature-branch
   ```

7. **Open a Pull Request:**  
   Go to your fork on GitHub and click “Compare & pull request”.

### Example: Automated Update Script (Work in Progress)

See [`fetch_bedrock_server.py`](./fetch_bedrock_server.py) for an example Python script that demonstrates progress toward [Issue #1: Automated Bedrock Server Update Checker & Installer](https://github.com/hooligeek/MinecraftBedrockServerUpgrade/issues/1).

This script is an early prototype for programmatically checking for new Bedrock server versions and automating the upgrade process.

If you’d like to help with this enhancement, please see [Issue #1](https://github.com/hooligeek/MinecraftBedrockServerUpgrade/issues/1), leave a comment, or open a pull request.

---

Thank you for helping make this project better!

---

*Created with ❤️ for the Minecraft community.*
