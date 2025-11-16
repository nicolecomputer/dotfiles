#!/usr/bin/env bash
set -e

TOOL_NAME="xclip"

install_tool() {
    if command -v xclip >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            # macOS has pbcopy/pbpaste built-in
            return 0
            ;;
        debian)
            sudo apt install -y xclip
            ;;
        fedora)
            sudo dnf install -y xclip
            ;;
        *)
            echo "xclip: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
