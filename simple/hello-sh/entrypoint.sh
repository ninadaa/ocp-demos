#!/bin/bash
set -Eeuo pipefail 

id
pwd
while true; do echo "Hello from appuser in container"; sleep 60; done