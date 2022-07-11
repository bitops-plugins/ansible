#!/usr/bin/env bash
set -e

echo ""
echo "When including a plugin in a BitOps install, this script will be called during docker build."
echo "It should be used to install any dependencies required to actually run your plugin."
echo "BitOps uses alpine linux as its base, so you'll want to use apk commands (Alpine Package Keeper)"
echo ""

echo "Installing ansible"

apk add py3-pip
# apk add ansible
# alias pip=pip3
# alias python=python3
pip3 install ansible

ansible --version | grep "python version"