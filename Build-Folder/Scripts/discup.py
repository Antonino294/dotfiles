#!/usr/bin/env python3

import os
import discord
import asyncio
import argparse
from dotenv import load_dotenv

load_dotenv()

DISCORD_TOKEN = os.getenv("DISCORD_TOKEN")
DISCORD_CHANNEL_ID = os.getenv("DISCORD_CHANNEL_ID")

intents = discord.Intents.default()
intents.members = True # enable the privileged members intent

async def upload_files_to_discord(files):
    print(f"Uploading {len(files)} file(s) to Discord...")
    client = discord.Client(intents=intents)

    @client.event
    async def on_ready():
        print(f"Connected to Discord as {client.user.name} ({client.user.id})")
        channel = client.get_channel(int(DISCORD_CHANNEL_ID))
        for file in files:
            print(f"Uploading file {file}...")
            with open(file, "rb") as f:
                filename = os.path.basename(file)
                await channel.send(file=discord.File(f, filename=filename))
                print("Upload complete!")
        await client.close()
        #await client.logout()

    await client.start(DISCORD_TOKEN)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Upload files to Discord channel.')
    parser.add_argument('files', metavar='file', type=str, nargs='+',
                        help='files to upload')
    args = parser.parse_args()
    asyncio.run(upload_files_to_discord(args.files))
