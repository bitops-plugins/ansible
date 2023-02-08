#!/usr/bin/env bash

set -x

export ENVIRONMENT="$BITOPS_ENVIRONMENT"
export ANSIBLE_ROOT="$BITOPS_OPSREPO_ENVIRONMENT_DIR" 
export ANSIBLE_BITOPS_CONFIG="$BITOPS_OPSREPO_ENVIRONMENT_DIR/bitops.config.yaml" 
export BITOPS_SCHEMA_ENV_FILE="$BITOPS_OPSREPO_ENVIRONMENT_DIR/ENV_FILE"
export BITOPS_CONFIG_SCHEMA="$BITOPS_INSTALLED_PLUGIN_DIR/bitops.schema.yaml'"
export SCRIPTS_DIR="$BITOPS_SCRIPTS_DIR"
export PLUGIN_DIR="$BITOPS_OPSREPO_ENVIRONMENT_DIR"

if [ "$ANSIBLE_SKIP_DEPLOY" == "true" ]; then
  echo "ANSIBLE_SKIP_DEPLOY is set.  Skipping."
  exit 0
fi

echo "Running Ansible Playbooks..."

if [ ! -d "$ANSIBLE_ROOT" ]; then
  echo "No ansible directory.  Skipping."
  exit 0
else
  printf "Deploying ansible... ${NC}"
fi


if [ -f "$ANSIBLE_BITOPS_CONFIG" ]; then
  echo "Ansible - Found BitOps config"
else
  echo "Ansible - No BitOps config"
fi

echo "cd Ansible Root: $ANSIBLE_ROOT"
cd $ANSIBLE_ROOT

# Check if the BITOPS_ANSIBLE_INVENTORY value is set
if [ -n "$BITOPS_ANSIBLE_INVENTORY" ]; then
  BITOPS_CONFIG_COMMAND="$BITOPS_CONFIG_COMMAND --inventory-file=$BITOPS_ANSIBLE_INVENTORY"
fi


echo "Running Ansible Playbooks"
bash -x $BITOPS_INSTALLED_PLUGIN_DIR/scripts/ansible_install_playbooks.sh "$BITOPS_CONFIG_COMMAND"
