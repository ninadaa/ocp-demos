#!/usr/bin/python
import time
try:
    import openshift_client as oc
    print("openshift_client installed")
except ImportError:
    print("openshift_client not installed")
    time.sleep(1200)

print('OpenShift client version: {}'.format(oc.get_client_version()))
print('OpenShift server version: {}'.format(oc.get_server_version()))

current_project = oc.get_project_name()
print(f"Aktuelles Projekt: {current_project}")

# Set a project context for all inner `oc` invocations and limit execution to 10 minutes
with oc.project(current_project), oc.timeout(10 * 60):

    while True:
        # Print the list of qualified pod names (e.g. ['pod/xyz', 'pod/abc', ...]  in the current project
        print('Found the following pods in {}: {}'.format(oc.get_project_name(), oc.selector('pods').qnames()))
        time.sleep(10)