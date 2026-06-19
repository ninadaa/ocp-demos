#!/bin/bash
set -Eeuo pipefail 

echo "Wer bin ich?"
id
echo "Wo stehe ich?"
pwd
echo "Meine Umgebung?"
echo "env:"
env | sort

echo "Starte Endlosschleife..."
while true; do echo "Hello from appuser in container"; sleep 60; done