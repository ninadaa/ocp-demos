#!/bin/bash
set -Eeuo pipefail 

echo "--- Docker Build + Deploy in $(oc project -q) starten..."
oc new-app https://github.com/ninadaa/ocp-demos.git --context-dir=oc-new-app/docker/hello-sh --name=hello-sh --strategy=docker

echo "--- Warte 30 Sekunden und ImageStreams zeigen ..."
sleep 30
oc get is

echo "--- Zeige Container Log..."
oc logs deploy/hello-sh
oc status

echo "--- Erstellte Objekte entfernen..."
#oc delete all --selector app=hello-sh
oc delete deploy/hello-sh && oc delete bc/hello-sh && oc delete is/hello-sh

#oc delete deploy,svc,bc -l app=hello-sh
sleep 30
oc status