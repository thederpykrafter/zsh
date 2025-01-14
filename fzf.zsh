source <(fzf --zsh)

# global settings
export FZF_DEFAULT_OPTS="\
  --border --layout='reverse-list' \
  --preview 'bat --color "always" --line-range 0:300 {}' \
  --pointer='->' --header='<C-c> or <ESC> to exit' \
  --cycle"
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

function recent() { # find recently opened dirs
  cd ~/$(echo $(dirs) | sed 's/ /\n/g' | fzf --query "$*" --header="select to return to project" --preview '' | sed 's/~//g')
}

function proj() { # find projects
  prev=$PWD
  dir=$(cd ~/Dev/ && fd . --maxdepth 2 --type d --type l | fzf --query "$*" --header="select to cd" --preview 'ls {}')

  if [ "$dir" != "" ]; then
    cd ~/Dev/$dir
    if [ -d .git ]; then
      git remote update
      git status
    fi
  else
    cd $prev
  fi
}

function conf() { # find projects
  prev=$PWD
  dir=$(cd ~/.config/ && fd . --maxdepth 1 --type d --type l | fzf --query "$*" --header="select to cd" --preview 'ls {}')

  if [ "$dir" != "" ]; then
    cd ~/.config/$dir
    if [ -d .git ]; then
      git remote update
      git status
    fi
  else
    cd $prev
  fi
}


function fzsh() { # find my .zsh files
  prev=$PWD
  cd $ZSH_CUSTOM 
  file=$(fd -H | grep -v ".git" | fzf --query "$*" || cd "$prev")

  if [ "$file" != "" ]; then
    nvim $file
    git remote update
    git status
  fi

  cd $prev
}

function makefiles() {
  prev=$PWD
  cd ~/Dev/c/Makefiles
  file=~/Dev/c/Makefiles/$(fd --maxdepth 1 --type d | fzf --query "$*" --preview "bat {}Makefile")Makefile
  cp $file $prev
  cd $prev
}

# open vim with fzf
alias vifz='file=$(fzf) && [[ -n $file ]] && nvim $file'
alias fzvi='file=$(fzf) && [[ -n $file ]] && nvim $file'
