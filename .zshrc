NEWLINE=$'\n'
PROMPT="${NEWLINE}%B[%b%B%~%b%B]%b${NEWLINE}%B> %b"

which exa >/dev/null 2>&1 && alias ls="exa --color always --icons -1"
which exa >/dev/null 2>&1 && alias tree="ls -T"
