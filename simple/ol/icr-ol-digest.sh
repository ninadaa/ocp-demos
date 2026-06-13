#!/bin/bash
set -Eeuo pipefail 

if [ -z "$1" ]; then
    echo "Bitte Tag angeben, z.B. 26.0.0.5-kernel-slim-java17-openj9-ubi"
    exit 1
fi   

OL_IMAGE_TAG=$1

SKOPEO_IMAGE="registry.redhat.io/ubi10/skopeo:latest"
SKOPEO_POD_NAME="my-skopeo"
OL_REGISTRY="icr.io/appcafe/open-liberty"

echo "Running in $(oc project -q)"
oc run ${SKOPEO_POD_NAME} --image=${SKOPEO_IMAGE} --restart=Never sleep 9999
oc wait --for=condition=Ready pod/${SKOPEO_POD_NAME}
oc rsh po/${SKOPEO_POD_NAME} skopeo --version
oc rsh po/${SKOPEO_POD_NAME} skopeo inspect --format "{{ .Digest }}" docker://${OL_REGISTRY}:${OL_IMAGE_TAG}
oc delete po/${SKOPEO_POD_NAME} --wait=false
