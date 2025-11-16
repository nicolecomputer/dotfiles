#!/usr/bin/env bash
set -e

TOOL_NAME="starship"

install_tool() {
    if command -v starship >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install starship
            ;;
        debian)
            sudo apt install -y starship
            ;;
        fedora)
            sudo dnf install -y starship
            ;;
        *)
            echo "starship: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
