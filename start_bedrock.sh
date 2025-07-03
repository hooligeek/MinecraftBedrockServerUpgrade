#!/bin/bash

SERVER_DIR=~/bedrock
SCREEN_NAME="bedrock"

if screen -list | grep -q "$SCREEN_NAME"; then
  echo "Server is already running in screen session '$SCREEN_NAME'."
  exit 0
fi

cd "$SERVER_DIR"
screen -L -Logfile bedrock_server.log -dmS "$SCREEN_NAME" ./bedrock_server
echo "Started Bedrock server."