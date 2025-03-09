#!/bin/bash

# Define paths
PATH="/usr/local/container/semaphore/tmp/194.164.207.57/usr/local/ssl"

# Function to rename to fullchain*.pem.key
create_fullchainkeypem() {
    local DIR=$1

    for file in "${DIR}"/privkey*.pem; do
        if [ -f "$file" ]; then
            BASENAME=$(basename "$file")
            NEW_BASENAME=$(echo "$BASENAME" | sed "s/^privkey/fullchain/; s/\.pem$/.pem.key/")
            NEW_FILE="${DIR}/${NEW_BASENAME}"
            cp "${file}" "${NEW_FILE}"
            echo "Renamed: ${file} -> ${NEW_FILE}"
        fi
    done
}

# Function to rename to .crt
create_crt() {
    local DIR=$1

    for file in "${DIR}"/cert*.pem; do
        if [ -f "$file" ]; then
            BASENAME=$(basename "$file")
            NEW_BASENAME=$(echo "$BASENAME" | sed "s/\.pem$/.crt/")
            NEW_FILE="${DIR}/${NEW_BASENAME}"
            cp "${file}" "${NEW_FILE}"
            echo "Renamed: ${file} -> ${NEW_FILE}"
        fi
    done
}

# Function to rename to .key
create_key() {
    local DIR=$1

    for file in "${DIR}"/privkey*.pem; do
        if [ -f "$file" ]; then
            BASENAME=$(basename "$file")
            NEW_BASENAME=$(echo "$BASENAME" | sed "s/\.pem$/.key/")
            NEW_FILE="${DIR}/${NEW_BASENAME}"
            cp "${file}" "${NEW_FILE}"
            echo "Renamed: ${file} -> ${NEW_FILE}"
        fi
    done
}

create_fullchainkeypem "${PATH}"

create_crt "${PATH}"

create_key "${PATH}"

# Create combined crtkey*.pem files
cat ${PATH}/cert.crt ${PATH}/privkey.key > ${PATH}/crtkey.pem
echo "Created: crtkey.pem from cert.crt and privkey.key"

echo "All completed"