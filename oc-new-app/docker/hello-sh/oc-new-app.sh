#!/bin/bash
set -Eeuo pipefail 

echo "Running Docker Build in $(oc project -q)"
oc new-app https://github.com/ninadaa/ocp-demos.git --context-dir=oc-new-app/docker/hello-sh --name=hello-sh --strategy=docker
