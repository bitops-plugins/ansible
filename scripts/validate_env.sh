#!/usr/bin/env bash
set -e 

if [ -z "$BITOPS_ENVIRONMENT" ]; then
  echo "environment variable (BITOPS_ENVIRONMENT) not set"
  exit 1
fi
