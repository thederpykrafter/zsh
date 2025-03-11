source <(fzf --zsh)

# global settings
export FZF_DEFAULT_OPTS="\
  --border \
  --layout='reverse-list' \
  --preview 'bat --color "always" --line-range 0:300 {}' \
  --pointer='->' \
  --header='<C-c> or <ESC> to exit' \
  --cycle \
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi"

export FZF_DEFAULT_COMMAND="fd --type f"

function fzd() { fd . $* --type d | fzf --preview 'ls {}'} # find dir

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
  if [ ! -d /data/data/com.termux/files ];
  then
    cd $(dirs -lp | fzf --query "$*" --header="select to return to project" --preview 'ls {}')
  else
    cd /data/data/com.termux/$(dirs -lp | sed 's/\/data\/data\/com.termux\///g' | fzf --query "$*" --header="select to return to project" --preview 'ls {}')
  fi
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

function fzssh() {
  all_clients="Flip4 S20 Endeavour"
  client=`echo "$all_clients" | sed "s/ /\n/g" | fzf`

  if [[ $client == Flip4 ]]; then
    ssh u0_a322@10.0.0.156 -p 8022 -i id_rsa
  elif [[ $client == S20 ]]; then
    ssh u0_a34@10.0.0.223 -p 8022 -i id_rsa
  elif [[ $client == Endeavour ]]; then
    ssh thederpykrafter@10.0.0.72 -i id_rsa
  fi
}
