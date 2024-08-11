# global settings
export FZF_DEFAULT_OPTS="\
  --height 50% --border --layout='reverse-list' \
  --preview 'bat --color "always" --line-range 0:100 {}' \
  --pointer='->' --header='<C-c> or <ESC> to exit'"
export FZF_DEFAULT_COMMAND="fd --type f"

function fzd() { fd . $* --type d | fzf } # find dir

function fzcd() { # find dir and cd
  prev=$PWD
  
  if [ "$1" != "" ]; then
    # cd into $1 first to shorten path in fzf
    cd $1 && shift && cd $(fzd $PWD $@ || echo "$prev")
  else
    cd $(fzd || echo "$prev")
  fi

}

function proj() { # find projects
  prev=$PWD
  dir=$(cd ~/Dev/ && fd . --maxdepth 2 --type d | fzf --query "$*" --header="select to cd" --preview 'ls {}')

  if [ "$dir" != "" ]; then
    cd ~/Dev/$dir
    if [ -d .git ]; then
      git status
    fi
  else
    cd $prev
  fi
}


function fzsh() { # find my .zsh files
  prev=$PWD
  file=$(cd $ZSH_CUSTOM && fzf --query "$*" || cd "$prev")

  if [ "$file" != "" ]; then
    cd $ZSH_CUSTOM && nvim $file
    git remote update
  fi

  cd $prev
}

# open vim with fzf
alias vifz='nvim $(fzf)'
alias fzvi='nvim $(fzf)'
