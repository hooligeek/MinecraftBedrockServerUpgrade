# Minecraft Bedrock Server Upgrade

A robust Bash script to safely upgrade your Minecraft Bedrock server with minimal downtime. This tool automatically backs up your existing server, preserves essential configuration files and worlds, and seamlessly deploys the latest Bedrock server release. Perfect for server admins who value reliability and simplicity.

## Features

- **Automated Backups:** Creates a timestamped backup of your current server before upgrading.
- **Config Preservation:** Keeps your `allowlist.json`, `permissions.json`, `server.properties`, and `worlds` directory intact.
- **Minimal Downtime:** Stops the server, upgrades, and restarts it automatically.
- **Easy to Use:** Single-command upgrade process.

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

## License

MIT License

---

*Created with ❤️ for the Minecraft
