#!/usr/bin/env bash
set -e

TOOL_NAME="bat"

install_tool() {
    if command -v bat >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install bat
            ;;
        debian)
            sudo apt install -y bat
            ;;
        fedora)
            sudo dnf install -y bat
            ;;
        *)
            echo "bat: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
