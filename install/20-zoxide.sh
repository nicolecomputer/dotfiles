#!/usr/bin/env bash
set -e

TOOL_NAME="zoxide"

install_tool() {
    if command -v zoxide >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install zoxide
            ;;
        debian)
            sudo apt install -y zoxide
            ;;
        fedora)
            sudo dnf install -y zoxide
            ;;
        *)
            echo "zoxide: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
