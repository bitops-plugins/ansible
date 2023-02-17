#!/usr/bin/env bash

# set -e: Exit immediately if a command exits with a non-zero status
# pipefail: If any command in a pipeline fails, that return code will be used 
set -e -o pipefail

if [ "$BITOPS_ANSIBLE_SKIP_DEPLOY" == "true" ]; then
  echo "BITOPS_ANSIBLE_SKIP_DEPLOY is set. Skipping."
  exit 0
fi

if [ ! -d "$BITOPS_OPSREPO_ENVIRONMENT_DIR" ]; then
  echo "No ansible directory exists in Operations Repository. Skipping."
  exit 0
fi

cd ${BITOPS_OPSREPO_ENVIRONMENT_DIR}

echo "Running: [ansible-playbook ${BITOPS_ANSIBLE_CLI}]"
ansible-playbook ${BITOPS_ANSIBLE_CLI}
