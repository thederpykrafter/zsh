
# style fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fd --type f"

function fzd() { fd --type d -g $* | fzf }
