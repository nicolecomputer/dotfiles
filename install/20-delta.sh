#!/usr/bin/env bash
set -e

TOOL_NAME="delta"

install_tool() {
    if command -v delta >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install git-delta
            ;;
        debian)
            sudo apt install -y git-delta
            ;;
        fedora)
            sudo dnf install -y git-delta
            ;;
        *)
            echo "git-delta: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
