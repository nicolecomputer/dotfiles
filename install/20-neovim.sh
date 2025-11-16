#!/usr/bin/env bash
set -e

TOOL_NAME="nvim"

install_tool() {
    if command -v nvim >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install neovim
            ;;
        debian)
            sudo apt install -y neovim
            ;;
        fedora)
            sudo dnf install -y neovim
            ;;
        *)
            echo "neovim: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
