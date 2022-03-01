#!/usr/bin/env bash
set -e

echo ""
echo "When including a plugin in a BitOps install, this script will be called during docker build."
echo "It should be used to install any dependencies required to actually run your plugin."
echo "BitOps uses alpine linux as its base, so you'll want to use apk commands (Alpine Package Keeper)"
echo ""

#apk info

mkdir -p /opt/download
cd /opt/download

function install_terraform() {
    while IFS='' read -r version; do
        TERRAFORM_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip"
        echo ${TERRAFORM_DOWNLOAD_URL}
        curl -LO ${TERRAFORM_DOWNLOAD_URL} && unzip terraform_${version}_linux_amd64.zip -d ./
        mv terraform /usr/local/bin/terraform-${version}
        chmod +x /usr/local/bin/terraform-${version}
    done <<< "$TERRAFORM_VERSIONS"
}

install_terraform
