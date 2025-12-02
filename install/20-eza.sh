#!/usr/bin/env bash
set -e

TOOL_NAME="eza"

install_tool() {
    if command -v eza >/dev/null; then
        return 0
    fi

    case "$PLATFORM" in
        mac)
            brew install eza
            ;;
        debian)
            # Try apt first
            if sudo apt install -y eza 2>/dev/null; then
                return 0
            fi

            # If that fails, add eza repo
            echo "eza not in repos, adding eza repository..."
            sudo mkdir -p /etc/apt/keyrings
            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
            sudo apt update
            sudo apt install -y eza
            ;;
        fedora)
            sudo dnf install -y lsd
            ;;
        *)
            echo "eza: unsupported platform $PLATFORM"
            return 1
            ;;
    esac
}

install_tool
