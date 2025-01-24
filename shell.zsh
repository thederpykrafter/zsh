ZSH_THEME="cryptic"
CRYPTIC_THEME_SHOW_TIME=true

function update() {
  if command -v yay &> /dev/null; then
    yay -Syy
    yay -Syu --noconfirm
  elif command -v nala &> /dev/null; then
    nala update && nala upgrade -y
  elif command -v pkg &> /dev/null; then
    pkg update -y && pkg upgrade -y
  elif command -v apt &> /dev/null; then
    apt update -y && apt upgrade -y
  fi
}

alias setup="~/Dev/sh/universal-setup/setup.sh"

alias killjava="killall -9 java"

function code() {
  if [ -f /usr/bin/code-insiders ];
  then
    /usr/bin/code-insiders
  elif [ -f /usr/bin/code ];
  then
    /usr/bin/code
  else
    echo -e "\[91mPlease ensure [code || code-insiders] is installed properly.\[m"
  fi
}

# cls
alias cls='clear'

# reload zsh
if [ -d ~/.termux ]; then
  alias reload='termux-reload-settings && source $ZSH_CUSTOM/.zshrc'
else
  alias reload='source $ZSH_CUSTOM/.zshrc'
fi

alias get-repos='~/Dev/sh/get-repos/get-repos.sh'

alias sched='~/Dev/sh/work-sched/sched'

# nvim alias
alias vim='nvim'
alias vi='nvim'
alias tvi='NVIM_APPNAME=termux-nvim nvim'

# clean nvim or provided nvim config name
function clean_vim() {
  if [ ! -z "$1" ];
  then
    rm -rf .cache/$1 .local/state/$1 .local/share/$1
    echo "Cleaned .cache/$1 .local/state/$1 .local/share/$1"
  else
    rm -rf .cache/nvim .local/state/nvim .local/share/nvim
    echo "Cleaned .cache/nvim .local/state/nvim .local/share/nvim"
  fi
}

# not needed if nvidia setup correctly
#alias godot='godot --rendering-driver opengl3 &'

cat ~/.oh-my-zsh/custom/image
