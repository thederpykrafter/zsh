# global settings
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fd --type f"

# find dir
function fzd() { fd . $1 --type d | fzf }

# find dir and cd
function fzcd() { cd $(fzd $1) }

# find projects
function proj() {
  cd
  fzcd Dev/
}
