#!/bin/bash
set -euo pipefail

sudo yum install -y jq

# Applies all available updates, including security patches
sudo yum update -y
