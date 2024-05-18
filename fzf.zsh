
# global settings
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

if [[ -f /data/data/com.termux/files/home/.termux/termux.properties ]]; then
    export FZF_DEFAULT_COMMAND="fd --type f"
    function fzd() { fd --type d -g $* | fzf }
else
    export FZF_DEFAULT_COMMAND="fdfind --type f"
    function fzd() { fdfind --type d -g $* | fzf}
fi