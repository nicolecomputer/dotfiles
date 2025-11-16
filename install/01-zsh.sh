#!/usr/bin/env bash
set -e

TOOL_NAME="zsh"

install_tool() {
    # Install zsh if not present
    if ! command -v zsh >/dev/null; then
        case "$PLATFORM" in
            mac)
                brew install zsh
                ;;
            debian)
                sudo apt install -y zsh
                ;;
            fedora)
                sudo dnf install -y zsh
                ;;
            *)
                echo "zsh: unsupported platform $PLATFORM"
                return 1
                ;;
        esac
    fi

    # Set zsh as default shell if it isn't already
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting zsh as default shell..."
        chsh -s "$(which zsh)"
        echo "Note: You'll need to log out and back in for shell change to take effect"
    fi
}

install_tool
