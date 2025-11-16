#!/usr/bin/env bash
set -e

TOOL_NAME="htop"

install_tool() {
    if command -v htop >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install htop
            ;;
        debian)
            sudo apt install -y htop
            ;;
        fedora)
            sudo dnf install -y htop
            ;;
        *)
            echo "htop: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
