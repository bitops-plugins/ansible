#!/usr/bin/env bash

set -x

export ENVIRONMENT="$BITOPS_ENVIRONMENT"
export ANSIBLE_ROOT="$BITOPS_OPSREPO_ENVIRONMENT_DIR" 
export ANSIBLE_BITOPS_CONFIG="$BITOPS_OPSREPO_ENVIRONMENT_DIR/bitops.config.yaml" 
export BITOPS_SCHEMA_ENV_FILE="$BITOPS_OPSREPO_ENVIRONMENT_DIR/ENV_FILE"
export BITOPS_CONFIG_SCHEMA="$BITOPS_PLUGIN_DIR/bitops.schema.yaml'"
export SCRIPTS_DIR="$BITOPS_SCRIPTS_DIR"
export PLUGIN_DIR="$BITOPS_OPSREPO_ENVIRONMENT_DIR"


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

# bash $SCRIPTS_DIR/deploy/before-deploy.sh "$ANSIBLE_ROOT"

# export BITOPS_CONFIG_COMMAND="$(ENV_FILE="$BITOPS_SCHEMA_ENV_FILE" DEBUG="" bash $SCRIPTS_DIR/bitops-config/convert-schema.sh $BITOPS_CONFIG_SCHEMA $ANSIBLE_BITOPS_CONFIG)"
# echo "BITOPS_CONFIG_COMMAND: $BITOPS_CONFIG_COMMAND"
# echo "BITOPS_SCHEMA_ENV_FILE: $(cat $BITOPS_SCHEMA_ENV_FILE)"
# source "$BITOPS_SCHEMA_ENV_FILE"


bash $SCRIPTS_DIR/plugins/ansible/scripts/validate_env.sh


echo "Running Ansible Playbooks"
bash -x $SCRIPTS_DIR/plugins/ansible/scripts/ansible_install_playbooks.sh "$BITOPS_CONFIG_COMMAND"

# bash $SCRIPTS_DIR/deploy/after-deploy.sh "$ANSIBLE_ROOT"
