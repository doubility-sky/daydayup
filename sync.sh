#!/bin/bash
dir=$(cd "$(dirname "$0")" || exit; pwd)
echo "PWD: $dir"

iCloudFolder="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/daydayup"

if [ -d "$iCloudFolder" ]; then
    rsync -avz --delete --exclude={'*.git','*.obsidian',} . "$iCloudFolder"
    echo "Sync to iCloud"
fi
