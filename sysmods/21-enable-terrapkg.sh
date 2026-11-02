#!/usr/bin/env bash
set -eou pipefail
dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
