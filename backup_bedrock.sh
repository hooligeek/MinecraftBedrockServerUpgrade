#!/bin/bash

WORLD_DIR="/home/hooligeek/bedrock/worlds"
BACKUP_DIR="/home/hooligeek/bedrock_backup"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/minecraft_backup_${DATE}.tar.gz"
RETENTION=7  # Number of backups to keep

# Create backup
tar -czf "$BACKUP_FILE" -C "$WORLD_DIR" .

# Cleanup old backups, keep only $RETENTION most recent
cd "$BACKUP_DIR"
ls -1tr minecraft_backup_*.tar.gz | head -n -$RETENTION | xargs -d '\n' rm -f --
