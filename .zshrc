NEWLINE=$'\n'

which exa >/dev/null 2>&1 && alias ls="exa --color always --icons -1"
which exa >/dev/null 2>&1 && alias tree="ls -T"

# Setup iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set ZSH options so that history is shared between shells
setopt SHARE_HISTORY HIST_IGNORE_DUPS

# Save lots of history because I like having it to reference
alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE

PROMPT="${NEWLINE}%B[%b%B%~%b%B]%b${NEWLINE}%{$(iterm2_prompt_mark)%}> %b"
