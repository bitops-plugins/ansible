#!/usr/bin/env bash
set -e

echo ""
echo "When including a plugin in a BitOps install, this script will be called during docker build."
echo "It should be used to install any dependencies required to actually run your plugin."
echo "BitOps uses alpine linux as its base, so you'll want to use apk commands (Alpine Package Keeper)"
echo ""

if ! command -v ansible >/dev/null; then
        echo "Installing Ansible dependencies and Git."
        if command -v yum >/dev/null; then
                sudo yum install -y git python python-devel
        elif command -v apt-get >/dev/null; then
                sudo apt-get update -qq
                #sudo apt-get install -y -qq git python-yaml python-paramiko python-jinja2
                sudo apt-get install -y -qq git python python-dev
        else
                echo "neither yum nor apt-get found!"
                exit 1
        fi
        echo "Installing ansible via pip3 "
        # wget http://peak.telecommunity.com/dist/ez_setup.py
        # sudo python ez_setup.py && rm -f ez_setup.py
        # sudo easy_install pip
        # # Make sure setuptools are installed crrectly.
        # sudo pip install setuptools --no-use-wheel --upgrade
        # echo "Installing required python modules."
        # sudo pip install paramiko pyyaml jinja2 markupsafe
        sudo pip3 install ansible
fi
