NEWLINE=$'\n'
PROMPT="${NEWLINE}%B[%b%B%~%b%B]%b${NEWLINE}%B> %b"

exa | alias ls="exa --color always --icons -1"
exa | alias tree="ls -T"
