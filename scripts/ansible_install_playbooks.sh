#!/usr/bin/env bash
set -e

ANSIBLE_ARGS=$1
PLUGIN_DIR="$BITOPS_OPSREPO_ENVIRONMENT_DIR"

echo "Running ansible_install_playbook.sh for $PLUGIN_DIR with args $ANSIBLE_ARGS"

for playbook in $(ls $PLUGIN_DIR/*[^bitops.config].yaml || ls $PLUGIN_DIR/*[^bitops.config].yml); do
    echo "Executing playbook: $playbook"
    ansible-playbook $playbook $ANSIBLE_ARGS -e 'ansible_python_interpreter=/usr/bin/python3'
done