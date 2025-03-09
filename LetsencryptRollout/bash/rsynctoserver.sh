#!/bin/bash

# Define the source directory
SOURCE_DIR1="/usr/local/container/semaphore/tmp/IP/usr/local/ssl"

# Array of source directories
SOURCE_DIRS=("$SOURCE_DIR1")

# Target directory on the servers
TARGET_DIR1="root@IP1:/etc/ssl/letsen"
TARGET_DIR2="root@IP2:/etc/ssl/letsen"

# Array of target directories
TARGET_DIRS=("$TARGET_DIR1" "$TARGET_DIR2")

# Options for rsync total
RSYNC_OPTIONS="-avz"

# Rsync to Prod Proxy
rsync $RSYNC_OPTIONS "$SOURCE_DIR1/" "$TARGET_DIR1"

# Rsync to Internal Vader
rsync $RSYNC_OPTIONS "$SOURCE_DIR1/" "$TARGET_DIR2"

echo "All operations completed."