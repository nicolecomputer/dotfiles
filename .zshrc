NEWLINE=$'\n'

which exa >/dev/null 2>&1 && alias ls="exa --color always --icons -1"
which exa >/dev/null 2>&1 && alias tree="ls -T"

# Setup iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set ZSH options so that history is shared between shells
setopt append_history share_history histignorealldups

# Save lots of history because I like having it to reference
alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE

PROMPT="${NEWLINE}%B[%b%B%~%b%B]%b${NEWLINE}%{$(iterm2_prompt_mark)%}> %b"

test -e "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

test -e "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh" && source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Tab completions for things like man and kill
autoload compinit && compinit
