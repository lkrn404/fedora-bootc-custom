#!/usr/bin/env bash
set -euo pipefail

dnf install noctalia umbriel-nightly ghostty 

# Wip - needs greeter state and user configured
# dnf install noctalia-greeter
#systemctl enable greetd.service
