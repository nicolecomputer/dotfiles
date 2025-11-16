alias tree="eza -T"

# Add consistent clipboard aliases
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

eval "$(starship init zsh)"
