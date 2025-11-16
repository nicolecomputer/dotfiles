#!/usr/bin/env bash
set -e

TOOL_NAME="eza"

install_tool() {
    if command -v eza >/dev/null; then
        return 0  # Already installed
    fi

    case "$PLATFORM" in
        mac)
            brew install eza
            ;;
        debian)
            sudo apt install -y eza
            ;;
        fedora)
            sudo dnf install -y eza
            ;;
        *)
            echo "eza: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

# Call the install function
install_tool
