#!/bin/bash

SCREEN_NAME="bedrock"

if screen -list | grep -q "$SCREEN_NAME"; then
  echo "Stopping Minecraft Bedrock server in screen session '$SCREEN_NAME'..."
  screen -S "$SCREEN_NAME" -X stuff "stop$(printf \\r)"
  sleep 5
  screen -S "$SCREEN_NAME" -X quit
  echo "Server stopped."
else
  echo "No running screen session named '$SCREEN_NAME' found."
fi