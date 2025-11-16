#!/usr/bin/env bash
set -e

TOOL_NAME="ssh-key"

install_tool() {
    SSH_KEY="$HOME/.ssh/id_ed25519"

    if [ -f "$SSH_KEY" ]; then
        return 0  # Key already exists
    fi

    echo "No SSH key found. Generating new ed25519 key..."

    # Generate key with nicole@hostname
    ssh-keygen -t ed25519 -C "nicole@$(hostname)" -f "$SSH_KEY" -N ""

    echo "SSH key generated at $SSH_KEY"
    echo "Public key:"
    cat "$SSH_KEY.pub"

    # Start ssh-agent and add key
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_KEY"

    echo ""
    echo "Add this public key to GitHub/GitLab/etc:"
    echo "https://github.com/settings/keys"
}

install_tool
