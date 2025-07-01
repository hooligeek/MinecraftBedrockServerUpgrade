#!/bin/bash

# Check for zip file argument
if [ -z "$1" ]; then
  echo "Usage: $0 <path-to-bedrock-server-zip>"
  exit 1
fi

ZIP_FILE="$1"
SERVER_DIR=~/bedrock
BACKUP_DIR=~/bedrock_backup_$(date +%Y%m%d_%H%M%S)
TEMP_DIR=~/bedrock_temp_upgrade
SCREEN_NAME="bedrock"

# Step 1: Stop the server if running in screen
if screen -list | grep -q "$SCREEN_NAME"; then
  echo "Stopping Minecraft Bedrock server in screen session '$SCREEN_NAME'..."
  screen -S "$SCREEN_NAME" -X stuff "stop$(printf \r)"
  sleep 5
  screen -S "$SCREEN_NAME" -X quit
else
  echo "No running screen session named '$SCREEN_NAME' found."
fi

# Step 2: Backup current server
echo "Backing up current server to $BACKUP_DIR..."
cp -r "$SERVER_DIR" "$BACKUP_DIR"

# Step 3: Extract new server files
echo "Extracting new server files from $ZIP_FILE..."
mkdir -p "$TEMP_DIR"
unzip -o "$ZIP_FILE" -d "$TEMP_DIR"

# Step 4: Preserve important config files and worlds directory
echo "Preserving configuration files and worlds directory..."
cp "$SERVER_DIR/allowlist.json" "$TEMP_DIR"
cp "$SERVER_DIR/permissions.json" "$TEMP_DIR"
cp "$SERVER_DIR/server.properties" "$TEMP_DIR"
cp -r "$SERVER_DIR/worlds" "$TEMP_DIR"

# Step 5: Replace old server files
echo "Updating server files..."
rm -rf "$SERVER_DIR"/*
cp -r "$TEMP_DIR"/* "$SERVER_DIR"

# Step 6: Clean up
rm -rf "$TEMP_DIR"

# Step 7: Restart the server in a screen session
echo "Starting Minecraft Bedrock server in screen session '$SCREEN_NAME'..."
cd "$SERVER_DIR"
screen -dmS "$SCREEN_NAME" ./bedrock_server > bedrock_server.log 2>&1

echo "Upgrade complete!"