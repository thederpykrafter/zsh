# global settings
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fd --type f"

# find dir
function fzd() { fd . $* --type d | fzf }

# find dir and cd
function fzcd() { cd $(fzd $*) }

# find projects
function proj() {
  cd
  fzcd Dev/ --maxdepth 2
}
