#!/usr/bin/env bash
set -e

TOOL_NAME="atuin"

install_tool() {
    if command -v atuin >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install atuin
            ;;
        debian)
            sudo apt install -y atuin
            ;;
        fedora)
            sudo dnf install -y atuin
            ;;
        *)
            echo "atuin: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
