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
    inventory: beta
    main-playbook: playbook.yaml
    extra-vars: "@extra-vars.json"
    flush-cache: true
    force-handlers: true
    forks: 20
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

-------------------
### extra-vars
* **BitOps Property:** `extra-vars`
* **Environment Variable:** `BITOPS_ANSIBLE_EXTRA_VARS`

Add additional ansible playbook parameters directly or load via JSON/YAML file.

-------------------
### flush-cache
* **BitOps Property:** `flush-cache`
* **Environment Variable:** `BITOS_ANSIBLE_FLUSH_CACHE`

Clear the fact cache for every host in inventory.

-------------------
### force-handlers
* **BitOps Property:** `force-handlers`
* **Environment Variable:** `BITOPS_ANSIBLE_FORCE_HANDLERS`

Clear the fact cache for every host in inventory.

-------------------
### forks
* **BitOps Property:** `forks`
* **Environment Variable:** `BITOPS_ANSIBLE_FORKS`

Specify number of parallel processes to use (default=5).

-------------------
### inventory
* **BitOps Property:** `inventory`
* **Environment Variable:** `BITOPS_ANSIBLE_INVENTORY`

Specify inventory host path or comma separated host list.

-------------------
### main-plabook
* **BitOps Property:** `main-playbook`
* **Environment Variable:** `BITOPS_ANSIBLE_MAIN_SCRIPT`
* **Required:** `true`
* **Default:** `playbook.yaml`

Specify which playbook to run ansible-playbook with

-------------------
### skip-tags
* **BitOps Property:** `skip-tags`
* **Environment Variable:** `BITOPS_ANSIBLE_SKIP_TAGS`

Only run plays and tasks whose tags do not match these values.

-------------------
### tags
* **BitOps Property:** `tags`
* **Environment Variable:** `BITOPS_ANSIBLE_TAGS`

Only run plays and tasks tagged with these values.

-------------------
### dryrun
* **BitOps Property:** `dryrun`
* **Environment Variable:** `BITOPS_ANSIBLE_DRYRUN`

Don't make any changes; instead, try to predict some of the changes that may occur.

-------------------


## Options Configuration
Options configurations is used to export variables without using the CLI generation or for any advanced logic that is not supported by the Ansible CLI.

-------------------
### skip-deploy
* **BitOps Property:** `skip-deploy`
* **Environment Variable:** `ANSIBLE_SKIP_DEPLOY`

If set to "true", regardless of the stack-action, deployment actions will be skipped.

-------------------
### verbosity
* **BitOps Property:** `verbosity`
* **Environment Variable:** `BITOPS_ANSIBLE_VERBOSITY`

Equivalent to adding `-verbose` or repeating `-v` flags. Will override `[default]` `verbosity=` setting in ansible.cfg. Acceptable values `0|1|2|3|4`.
