#!/usr/bin/env bash

#Install swap on zram
set -euo pipefail

install -Dm644 \
    /tmp/build/config/zram-generator.conf \
    /usr/lib/systemd/zram-generator.conf
