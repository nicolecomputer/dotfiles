#!/usr/bin/env bash
set -e

TOOL_NAME="lazygit"

install_tool() {
    if command -v lazygit >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install lazygit
            ;;
        debian)
            sudo apt install -y lazygit
            ;;
        fedora)
            return 0
            sudo dnf install -y lazygit
            ;;
        *)
            echo "lazygit: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
