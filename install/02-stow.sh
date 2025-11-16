#!/usr/bin/env bash
set -e

TOOL_NAME="stow"

install_tool() {
    if command -v stow >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install stow
            ;;
        debian)
            sudo apt install -y stow
            ;;
        fedora)
            sudo dnf install -y stow
            ;;
        *)
            echo "stow: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
