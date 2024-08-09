# global settings
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fd --type f"

function fzd() { fd . $* --type d | fzf } # find dir

function fzcd() { # find dir and cd
  prev=$PWD
  
  if [ "$1" != "" ]; then
    # cd into $1 first to shorten path in fzf
    cd $1 && shift && cd $(fzd $@ || echo "$prev")
  else
    cd $(fzd || echo "$prev")
  fi

}

function proj() { # find projects
  cd ~/Dev && fzcd --maxdepth 2
}


function fzsh() { # find my .zsh files
  prev=$PWD
  file=$(cd $ZSH_CUSTOM && fzf || cd "$prev")

  if [ "$file" != "" ]; then
    nvim $file
  fi
}

# open vim with fzf
alias vifz='nvim $(fzf)'
alias fzvi='nvim $(fzf)'
