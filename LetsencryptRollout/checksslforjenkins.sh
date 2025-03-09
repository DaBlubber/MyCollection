#!/bin/bash

# Docker Container Name
CONTAINER_NAME="nginxproxymanager"

# Zertifikatspfad
CERT1="/etc/ssl/letsen/cert.pem"
CERT2="/usr/local/container/nginx/letsen/archive/npm-18/cert.pem"

# Jenkins API-URL und Job-Name
JENKINS_URL="JENKINS URL/RenewLetsEn/build"
JENKINS_USER="JENKINS USER"
JENKINS_TOKEN="JENKINS TOKEN"

# Funktion zur Überprüfung des Zertifikatablaufdatums
check_cert_expiry() {
    EXPIRY_DATE=$(openssl x509 -enddate -noout -in "$CERT1" | cut -d= -f2)
    EXPIRY_SECONDS=$(date -d "$EXPIRY_DATE" +%s)
    CURRENT_SECONDS=$(date +%s)
    DIFF_DAYS=$(( (EXPIRY_SECONDS - CURRENT_SECONDS) / 86400 ))

    if [[ $DIFF_DAYS -ge 30 ]]; then
        echo "Zertifikat hat noch $DIFF_DAYS Tage Gültigkeit. Kein Restart erforderlich."
        exit 0
    fi
}

# Funktion zur Überprüfung, ob der Container läuft
wait_for_container() {
    echo "Warte auf das Hochfahren des Containers..."
    while [[ $(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME") != "true" ]]; do
        sleep 2
    done
    echo "$CONTAINER_NAME läuft wieder."
}

# Zertifikatsablaufdatum prüfen
check_cert_expiry

# Starte den Docker-Container neu
echo "Starte $CONTAINER_NAME neu..."
docker restart "$CONTAINER_NAME"

# Warten bis der Container wieder läuft
wait_for_container

# Überprüfe, ob die Zertifikate existieren
if [[ ! -f "$CERT1" || ! -f "$CERT2" ]]; then
    echo "Eines oder beide Zertifikate existieren nicht!"
    exit 1
fi

# Vergleiche die Zertifikatsdateien
if ! cmp -s "$CERT1" "$CERT2"; then
    echo "Zertifikate stimmen nicht überein. Starte Jenkins-Build..."
    
    # Web API-Aufruf an Jenkins
    curl -X POST "$JENKINS_URL" \
         --user "$JENKINS_USER:$JENKINS_TOKEN" \
         --header "Jenkins-Crumb: ignore"  # Falls CSRF-Protection aktiv ist, evtl. vorher ein gültiges Crumb holen
else
    echo "Zertifikate sind identisch. Kein Jenkins-Build erforderlich."
fi
