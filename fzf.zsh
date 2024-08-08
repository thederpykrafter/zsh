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

# find my .zsh files
function fzsh() {
  cd $ZSH_CUSTOM && nvim $(fzf)
}

# open vim with fzf
alias vifz='nvim $(fzf)'
alias fzvi='nvim $(fzf)'
