#!/bin/bash
set -Eeuo pipefail

# Method 1: Environment variable (fastest)
echo "User via \$USER: $USER"

# Method 2: Command substitution (more robust against variable tampering)
echo "User via whoami: $(whoami)"

# Method 3: Original login user (ignores sudo)
echo "Original user: $(logname)"   

id
pwd
while true; do echo "Hello from appuser in container"; sleep 60; done