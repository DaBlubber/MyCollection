#!/bin/bash

# Define source folder
SOURCE="/usr/local/container/nginx/letsen/archive/npm-18"

# Define target folder
TARGET="/usr/local/ssl"

# Function to copy .pem files from a source folder to a target folder
copy_pem_files() {
    local SOURCE_DIR=$1
    local TARGET_DIR=$2

    # Delete existing target folder
    if [ -d "$TARGET_DIR" ]; then
         rm -r "$TARGET_DIR"
    fi

    # Check if the target folder exists, and create it if necessary
    if [ ! -d "$TARGET_DIR" ]; then
        mkdir -p "$TARGET_DIR"
    fi

    # Copy .pem files
    for file in "${SOURCE_DIR}"/*.pem; do
        if [ -f "$file" ]; then
            cp "$file" "$TARGET_DIR"
            echo "Copied: ${file} -> ${TARGET_DIR}"
        fi
    done
}

# Function to remove numbers from filenames in a given folder
remove_numbers_from_filenames() {
    local DIR=$1

    for file in "${DIR}"/*.pem; do
        if [ -f "$file" ]; then
            BASENAME=$(basename "$file")
            NEW_BASENAME=$(echo "$BASENAME" | sed 's/[0-9]//g')
            NEW_FILE="${DIR}/${NEW_BASENAME}"
            mv "$file" "$NEW_FILE"
            echo "Renamed: ${file} -> ${NEW_FILE}"
        fi
    done
}

# Copy .pem files from SOURCE to TARGET (Reuland Dev)
copy_pem_files "$SOURCE" "$TARGET"
# Remove numbers from filenames in TARGET
remove_numbers_from_filenames "$TARGET"
