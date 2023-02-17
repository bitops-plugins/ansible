# Bitops Plugin for Ansible


## Table of contents

1. [Introduction](#Introduction)
2. [Installation](https://github.com/bitops-plugins/ansible/blob/main/INSTALL.md)
3. [Deployment](#Deployment)

---

## Introduction
This plugin will let BitOps to automatically deploy ``ansible`` scripts on any provider or run ``ansible`` scripts for configuration management. 


## Deployment

``ansible`` plugin uses ```bitops.config.yaml``` located in the operations repo when deploying ansible scripts.

### Sample Config
```
ansible:
  cli:
    main-playbook: playbook.yaml
    extra-vars: "@extra-vars.json"
    flush-cache: true
    force-handlers: true
    forks: 20
    inventory: beta
    skip-tags: ignore-this-tag
    tags: run-with-this-tag
    dryrun: false
  options:
    verbosity: 4
```

### Ansible BitOps Schema

[bitops.schema.yaml](https://github.com/bitops-plugins/ansible/blob/main/bitops.schema.yaml)

## CLI configuration
CLI configuration is used to pass in CLI parameters to the ansible-playbook command.

| **Parameter** | **Environment Variable** | **Type** | **Required** | **Default** | **Description** |
| :--: | :--: | :--: | :--: | :--: | :--: |
| `main-playbook`  | `BITOPS_ANSIBLE_MAIN_PLAYBOOK`    | _string_  | _yes_ | `playbook.yaml` | Specify which playbook to run ansible-playbook with |
| `extra-vars`     | `BITOPS_ANSIBLE_EXTRA_VARS`     | _string_  | _no_  |  | Add additional ansible playbook parameters directly or load via JSON/YAML file. |
| `flush-cache`    | `BITOPS_ANSIBLE_FLUSH_CACHE`    | _boolean_ | _no_  |  | Clear the fact cache for every host in inventory. |
| `force-handlers` | `BITOPS_ANSIBLE_FORCE_HANDLERS` | _boolean_ | _no_  |  | Clear the fact cache for every host in inventory. |
| `forks`          | `BITOPS_ANSIBLE_FORKS`          | _integer_ | _no_  |  | Specify number of parallel processes to use. |
| `inventory`      | `BITOPS_ANSIBLE_INVENTORY`      | _string_  | _no_  |  | Specify inventory host path or comma separated host list. |
| `skip-tags`      | `BITOPS_ANSIBLE_SKIP_TAGS`      | _string_  | _no_  |  | Only run plays and tasks whose tags do not match these values. |
| `tags`           | `BITOPS_ANSIBLE_TAGS`           | _string_  | _no_  |  | Only run plays and tasks tagged with these values. |
| `dryrun`         | `BITOPS_ANSIBLE_DRYRUN`         | _boolean_ | _no_  |  | Don't make any changes; instead, try to predict some of the changes that may occur. |

-------------------

## Options Configuration
Options configurations are used to export variables without using the CLI generation or for any advanced logic that is not supported by the Ansible CLI.

| **Parameter** | **Environment Variable** | **Type** | **Required** | **Default** | **Description** | 
| :--: | :--: | :--: | :--: | :--: | :--: |  
| `skip-deploy` | `ANSIBLE_SKIP_DEPLOY`      | _boolean_ | _no_ |  | If set to "true", regardless of the stack-action, deployment actions will be skipped. | 
| `verbosity`   | `BITOPS_ANSIBLE_VERBOSITY` | _integer_ | _no_ |  | Equivalent to adding `-verbose` or repeating `-v` flags. Will override `[default]` `verbosity=` setting in ansible.cfg. Acceptable values `0\|1\|2\|3\|4`. |
