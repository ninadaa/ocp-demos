#!/bin/bash
set -Eeuo pipefail 

echo "Starting S2I Build in $(oc project -q) ..."
oc new-app registry.redhat.io/ubi9/python-314~https://github.com/ninadaa/ocp-demos.git --context-dir=oc-new-app/s2i/python/hello --name=py-hello

# oc rsh deploy/py-hello
#
# VIRTUAL_ENV=/opt/app-root
# PYTHON_VERSION=3.14
# PYTHONIOENCODING=UTF-8
# PWD=/opt/app-root/src
# STI_SCRIPTS_PATH=/usr/libexec/s2i

# oc delete deploy/py-hello && oc delete bc/py-hello && oc delete svc/py-hello