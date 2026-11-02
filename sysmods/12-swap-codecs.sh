#!/usr/bin/env bash

set -euo pipefail

# Swap nonfree codecs
dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Install codecs
dnf install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
