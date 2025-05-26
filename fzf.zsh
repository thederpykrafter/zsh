source <(fzf --zsh)

# global settings
export FZF_DEFAULT_OPTS="\
  --preview 'bat --color "always" --line-range 0:300 {}' \
  --header='<C-c> or <ESC> to exit' \
  --cycle \
  --multi \
"

# fzf theme
# https://vitormv.github.io/fzf-themes/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626
--color=hl:#f38ba8,hl+:#a485dd,info:#98c379,marker:#7199ee
--color=prompt:#a485dd,spinner:#f5e0dc,pointer:#d7a65f,header:#f38ba8
--color=gutter:#000000,border:#98c379,separator:#38a89d,label:#aeaeae
--color=query:#d9d9d9
--border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" "
--marker=" " --pointer=" " --separator="─" --scrollbar="│"
--layout="reverse-list" --info="right"'

export FZF_DEFAULT_COMMAND="fd --type f"

function fzd() { fd . $* --type d | fzf --preview 'tree {}'} # find dir

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
    cd $(dirs -lp | fzf --query "$*" --header="select to return to project" --preview 'tree {}')
  else
    cd /data/data/com.termux/$(dirs -lp | sed 's/\/data\/data\/com.termux\///g' | fzf --query "$*" --header="select to return to project" --preview 'tree {}')
  fi
}

function proj() { # find projects
  prev=$PWD
  dir=$(cd ~/Dev/ && fd . --maxdepth 2 --type d --type l | fzf --query "$*" --header="select to cd" --preview 'tree {}')

  if [ "$dir" != "" ]; then
    cd ~/Dev/$dir
  else
    cd $prev
  fi
}

function dots() { # find dotfiles
  prev=$PWD
  dot_file=$(cd ~ && fd -u --maxdepth 1 | grep "^\." | fzf --query "$*" --header="select to edit in vim" --preview 'tree {}')

  if [[ $dot_file == "" ]]; then
    cd $prev
  else
    nvim ~/$dot_file
    cd $prev
  fi
}


function conf() { # find projects
  prev=$PWD
  dir=$(cd ~/.config/ && fd . --maxdepth 1 --type d --type l | fzf --query "$*" --header="select to cd" --preview 'tree {}')

  if [ "$dir" != "" ]; then
    cd ~/.config/$dir
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
  fi

  cd $prev
}

# open vim with fzf
alias vifz='file=$(fzf) && [[ -n $file ]] && nvim $file'
alias fzvi='file=$(fzf) && [[ -n $file ]] && nvim $file'

function fzssh() {
  all_clients="Flip4 S20 Endeavour"
  client=`echo "$all_clients" | sed "s/ /\n/g" | fzf --preview=`

  if [[ $client == Flip4 ]]; then
    ssh u0_a322@10.0.0.156 -p 8022 -i id_rsa
  elif [[ $client == S20 ]]; then
    ssh u0_a34@10.0.0.223 -p 8022 -i id_rsa
  elif [[ $client == Endeavour ]]; then
    ssh thederpykrafter@10.0.0.72 -i id_rsa
  fi
}

function fzmc() {
  prev=$PWD
  cd ~/.local/share/PrismLauncher/instances/
  instance=`fd --maxdepth 1 --type d | fzf --query "$*" --preview "tree {}"`
  if [ "$instance" != "" ]; then
    cd $instance
  else
    cd $prev
  fi
}
