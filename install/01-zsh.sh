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
        if chsh -s "$(which zsh)" 2>/dev/null; then
            echo "Note: You'll need to log out and back in for shell change to take effect"
        else
            echo "chsh failed (common on ChromeOS). Adding zsh exec to shell profile instead..."
            # Add to .bashrc to auto-start zsh
            if ! grep -q "exec zsh" "$HOME/.bashrc"; then
                echo 'exec zsh' >> "$HOME/.bashrc"
            fi
        fi
    fi
}

install_tool
