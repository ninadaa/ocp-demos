#!/bin/bash
set -Eeuo pipefail 

echo "Running in $(oc project -q)"
oc new-app https://github.com/ninadaa/ocp-demos.git --context-dir=simple/hello-sh --name=hello-sh --strategy=docker
