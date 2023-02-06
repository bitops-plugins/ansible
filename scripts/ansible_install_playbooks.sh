#!/usr/bin/env bash
set -e

ANSIBLE_ARGS=$1
PLUGIN_DIR="$BITOPS_OPSREPO_ENVIRONMENT_DIR"

echo "Running ansible_install_playbook.sh for $PLUGIN_DIR with args $ANSIBLE_ARGS"

PLAYBOOK="$PLUGIN_DIR/$BITOPS_ANSIBLE_MAIN_SCRIPT"

if [[ -n $BITOPS_ANSIBLE_DRYRUN ]]; then
    # adding `--check` option to ansible args if `BITOPS_ANSIBLE_DRYRUN` is set
    ANSIBLE_ARGS="$ANSIBLE_ARGS --check" # DRY RUN
    ansible-playbook $PLAYBOOK "--list-tasks" # LIST TAKS
fi

echo "Running playbook. [ansible-playbook $PLAYBOOK $ANSIBLE_ARGS]"
ansible-playbook $PLAYBOOK $ANSIBLE_ARGS


# for playbook in $(ls $PLUGIN_DIR/*[^bitops.config].yaml || ls $PLUGIN_DIR/*[^bitops.config].yml); do
#     echo "Executing playbook: $playbook"
#     ansible-playbook $playbook $ANSIBLE_ARGS
# done
