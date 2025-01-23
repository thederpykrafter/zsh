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

function clean_vim() {
  rm -rf .cache/$1 .local/state/$1 .local/share/$1
}

# not needed if nvidia setup correctly
#alias godot='godot --rendering-driver opengl3 &'

cat ~/.oh-my-zsh/custom/image
