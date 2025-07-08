# Minecraft Bedrock Server Management Scripts

A robust suite of scripts to safely upgrade, run, back up, and monitor your Minecraft Bedrock server with minimal downtime. These tools automatically back up your existing server, preserve essential configuration files and worlds, and provide easy integration with Discord and automated world backups. Perfect for server admins who value reliability and simplicity.

---

## Scripts Overview

### 1. `upgrade_bedrock.sh`
Safely upgrades your Bedrock server with minimal downtime.

- **Backs up** your current server to a timestamped directory.
- **Preserves** essential config files and worlds.
- **Deploys** the new server version from a ZIP file.
- **Restarts** the server in a `screen` session.

**Usage:**
```bash
chmod +x upgrade_bedrock.sh
./upgrade_bedrock.sh /path/to/bedrock-server-<version>.zip
```

---

### 2. `start_bedrock.sh` and `stop_bedrock.sh`
Simple scripts to start and stop your Bedrock server in a `screen` session, with logging.

- `start_bedrock.sh` starts the server and logs output to `bedrock_server.log`.
- `stop_bedrock.sh` gracefully stops the server running in the screen session.

**Usage:**
```bash
chmod +x start_bedrock.sh stop_bedrock.sh
./start_bedrock.sh
./stop_bedrock.sh
```

---

### 3. `bedrock_log_to_discord.py`
Optional Python script to send player join/leave events from your Bedrock server log to a Discord channel via webhook.

- **Real-time Discord notifications** for player activity.
- **Customizable**: Edit keywords and formatting in the script.

**Setup:**
1. Create a Discord webhook and copy the URL.
2. Set the `LOG_FILE` variable in the script to your Bedrock log path.
3. Set the webhook URL as an environment variable:
   ```bash
   export DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/..."
   ```
4. Run the script:
   ```bash
   DISCORD_WEBHOOK_URL="your_webhook_url" python3 bedrock_log_to_discord.py
   ```

---

### 4. `backup_bedrock.sh`
Automated backup script for your world directory, with retention policy.

- **Creates a timestamped backup** of your world.
- **Keeps only the most recent N backups** (default: 7).
- **Safe for cron automation**.

**Usage:**
1. Place the script in your backup directory (e.g., `/home/hooligeek/backup_bedrock.sh`).
2. Make it executable:
   ```bash
   chmod +x /home/hooligeek/backup_bedrock.sh
   ```
3. Add to your crontab for daily backups at 2am:
   ```
   0 2 * * * /home/hooligeek/backup_bedrock.sh
   ```

**Script Example:**
```bash
#!/bin/bash
WORLD_DIR="/home/hooligeek/bedrock/worlds"
BACKUP_DIR="/home/hooligeek/bedrock_backup"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/minecraft_backup_${DATE}.tar.gz"
RETENTION=7  # Number of backups to keep

tar -czf "$BACKUP_FILE" -C "$WORLD_DIR" .
cd "$BACKUP_DIR"
ls -1tr minecraft_backup_*.tar.gz | head -n -$RETENTION | xargs -d '\n' rm -f --
```

---

## Customization

- Adjust paths and retention in the scripts as needed for your setup.
- See each script’s comments for more options.

---

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

---

*Created with ❤️ for the Minecraft community. See individual script files for detailed documentation and usage instructions.*
