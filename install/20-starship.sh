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
            # Try apt first
            if sudo apt install -y starship 2>/dev/null; then
                return 0
            fi

            # If that fails, download binary from GitHub
            echo "starship not in repos, downloading binary..."
            mkdir -p ~/.local/bin
            export BIN_DIR="~/.local/bin"
            curl -sS https://starship.rs/install.sh | sh -s -- -y
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
