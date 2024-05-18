
# style fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fdfind --type f"

function fzd() { fdfind --type d -g $* | fzf }