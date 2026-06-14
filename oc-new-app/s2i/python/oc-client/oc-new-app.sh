#!/bin/bash

# https://github.com/openshift/openshift-client-python
# https://pypi.org/project/openshift-client/

set -Eeuo pipefail 

echo "Starting S2I Build in $(oc project -q) ..."
oc new-app registry.redhat.io/ubi9/python-314~https://github.com/ninadaa/ocp-demos.git --context-dir=oc-new-app/s2i/python/oc-client --name=py-oc-client

# oc rsh deploy/py-oc-client
# oc delete deploy/py-oc-client && oc delete bc/py-oc-client && oc delete svc/py-oc-client