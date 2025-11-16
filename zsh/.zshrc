# Make sure local bin is in PATH
export PATH="$HOME/.local/bin:$PATH"

alias tree="eza -T"
alias ls="eza --icons"
alias lg="lazygit"


# Add consistent clipboard aliases
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# Initialize atuin for better shell history
if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh --disable-up-arrow)"
fi

eval "$(starship init zsh)"
