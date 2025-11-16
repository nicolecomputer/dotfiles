#!/usr/bin/env bash
set -e

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/install" && pwd)"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PLATFORM="mac"
elif [ -f /etc/debian_version ]; then
    export PLATFORM="debian"
elif [ -f /etc/fedora-release ]; then
    export PLATFORM="fedora"
else
    echo "Unsupported platform"
    exit 1
fi

echo "Platform: $PLATFORM"
echo "Installing tools..."
echo

# Install tools
for script in "$INSTALL_DIR"/*.sh; do
    # Source the script to get TOOL_NAME
    TOOL_NAME=""
    source "$script"

    if command -v "$TOOL_NAME" >/dev/null 2>&1; then
        echo "✓ $TOOL_NAME"
    else
        echo "✗ $TOOL_NAME (failed to install)"
    fi
done

echo
echo "Stowing dotfiles..."
cd ~/dotfiles


stow zsh
stow git
stow starship
stow atuin


echo "Done! Restart your shell."
