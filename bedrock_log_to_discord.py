# filepath: /home/hooligeek/bedrock_log_to_discord.py
import time
import re
import requests

LOG_FILE = "/home/hooligeek/bedrock/bedrock_server.log"
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1389622535473336340/vA_zfn6CPUJ3WCp5HHV7FQqOqAW6pJTxYObny6hSSUk4ef40XLqNVj6DARNZBfLyPF3e"
KEYWORDS = ["Player Spawned", "Player disconnected"]

def prettify_log(line):
    # Player Spawned
    match_spawn = re.search(r'Player Spawned: (.+?) xuid:', line)
    if match_spawn:
        player = match_spawn.group(1).strip()
        return f"🟢 **{player}** joined the game!"
    # Player disconnected
    match_disconnect = re.search(r'Player disconnected: (.+?), xuid:', line)
    if match_disconnect:
        player = match_disconnect.group(1).strip()
        return f"🔴 **{player}** left the game."
    return None

def send_to_discord(message):
    data = {"content": message}
    requests.post(DISCORD_WEBHOOK_URL, json=data)

def tail_log():
    with open(LOG_FILE, "r") as f:
        f.seek(0, 2)
        while True:
            line = f.readline()
            if not line:
                time.sleep(0.5)
                continue
            if any(keyword in line for keyword in KEYWORDS):
                pretty = prettify_log(line)
                if pretty:
                    send_to_discord(pretty)

if __name__ == "__main__":
    tail_log()