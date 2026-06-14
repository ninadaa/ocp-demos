#!/bin/bash
set -Eeuo pipefail 

SKOPEO_IMAGE="registry.redhat.io/ubi10/skopeo:latest"
SKOPEO_POD_NAME="my-skopeo"
OL_REGISTRY="icr.io/appcafe/open-liberty"
OUT_FILE_NAME="icr-open-liberty-tags.txt"
DATE=$(date +"%Y%m%d_%H-%M-%S")

echo "Running in $(oc project -q)"
oc run ${SKOPEO_POD_NAME} --image=${SKOPEO_IMAGE} --restart=Never sleep 9999
oc wait --for=condition=Ready pod/${SKOPEO_POD_NAME}
oc rsh po/${SKOPEO_POD_NAME} skopeo --version
oc rsh po/${SKOPEO_POD_NAME} skopeo list-tags docker://${OL_REGISTRY} > ${DATE}_${OUT_FILE_NAME}
ls -l ${DATE}_${OUT_FILE_NAME}
oc delete po/${SKOPEO_POD_NAME}
