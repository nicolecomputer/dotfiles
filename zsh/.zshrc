# Make sure local bin is in PATH
export PATH="$HOME/.local/bin:$PATH"

alias tree="eza -T"
alias ls="eza --icons"
alias lg="lazygit"

# Use bat as cat replacement
if command -v batcat >/dev/null 2>&1; then
    alias cat="batcat"
    alias bat="batcat"
    # Set bat as the default pager for man pages
    export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif command -v bat >/dev/null 2>&1; then
    alias cat="bat"
    # Set bat as the default pager for man pages
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi


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
