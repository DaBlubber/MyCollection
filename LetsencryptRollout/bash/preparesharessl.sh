#!/bin/bash

# Set source and destination directories
SOURCE_DIR="/etc/ssl/letsen"
DEST_DIR="/mnt/ssl"

# Check if destination directory is empty
if [ "$(ls -A $DEST_DIR)" ]; then
    echo "Destination directory is not empty. Deleting files..."
    rm -rf $DEST_DIR/*
else
    echo "Destination directory is empty. Proceeding with copy operation..."
fi

# Check if files were successfully deleted
if [ "$(ls -A $DEST_DIR)" ]; then
    echo "Files could not be deleted. Aborting copy operation..."
    exit 1
else
    echo "Files successfully deleted. Proceeding with copy operation..."
    cp -r $SOURCE_DIR/* $DEST_DIR
fi

# Check if copy operation was successful
if [ "$(diff -r $SOURCE_DIR $DEST_DIR)" ]; then
    echo "Copy operation failed."
    exit 1
else
    echo "Copy operation successful."
fi

# Create .pfx file from .pem files
PEM_PATH="/mnt/ssl/cert.pem"
KEY_PATH="/mnt/ssl/privkey.key"
PFX_PATH="/mnt/ssl/wildcard.pfx"
PASSWORD="PASSWORT"

# Create .pfx file
openssl pkcs12 -export -out $PFX_PATH -inkey $KEY_PATH -in $PEM_PATH -password pass:$PASSWORD

echo "Now sorting will begin."

# Create subdirectory
mkdir -p "${DEST_DIR}/DOMAIN"

# Search for files in DEST_DIR and move them
for file in "${DEST_DIR}"/*; do
    # Check if it is a file
    if [ -f "$file" ]; then
        BASENAME=$(basename "$file")

        mv "$file" "${DEST_DIR}/DOMAIN/"
        echo "Moved: $BASENAME -> DOMAIN"
    fi
done

echo "File sorting completed."