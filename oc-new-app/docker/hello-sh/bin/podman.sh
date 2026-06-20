#!/bin/bash
set -Eeuo pipefail 

VERSION=$1

podman version
echo "Image lokal mit Podman bauen..."
podman build ../ -t hello:${VERSION}

echo "--- Container lokal aus dem Image starten..."
podman run -d --rm --name hello hello:${VERSION}

echo "--- Warte 10 Sekunden und zeige Images..."
sleep 10
podman images

echo "--- Zeige Container Log..."
podman logs hello

echo "--- Container beenden und entfernen..."
podman kill hello
podman ps

echo "--- Image entfernen..."
podman rmi hello:${VERSION}
podman images
