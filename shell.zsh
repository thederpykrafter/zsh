ZSH_THEME="cryptic"
CRYPTIC_THEME_SHOW_TIME=true

if [ ! -L ~/.zshrc ]; then
  rm -f ~/.zshrc
  ln -s ~/.oh-my-zsh/.zshrc ~/.zshrc
fi

function update() {
  function update_os() {
    if command -v yay &> /dev/null; then
      yay -Syy
      yay -Syu --noconfirm
    elif command -v pacman &> /dev/null; then
      pacman -Syy
      pacman -Syu --noconfirm
    elif command -v nala &> /dev/null; then
      nala update && nala upgrade -y
    elif command -v pkg &> /dev/null; then
      pkg update -y && pkg upgrade -y
    elif command -v apt &> /dev/null; then
      apt update -y && apt upgrade -y
    fi
    date +%j > ~/.lastupdate
  }

  if [ -f ~/.lastupdate ]; then
    last_update=`cat ~/.lastupdate`
    today=`date +%j`
    if [[ $last_update < $today ]]; then
      update_os
    else
      echo "you already updated today bro" | lolcat
    fi
  else
    update_os
  fi
}

alias setup="~/Dev/sh/universal-setup/setup.sh"

alias killjava="killall -9 java"

function code() {
  if [ -f /usr/bin/code-insiders ];
  then
    /usr/bin/code-insiders $*
  elif [ -f /usr/bin/code ];
  then
    /usr/bin/code $*
  else
    echo -e "\[91mPlease ensure [code || code-insiders] is installed properly.\[m"
  fi
}

# cls
alias cls='clear'

# reload zsh
if [ -d ~/.termux ]; then
  alias xdg-open='xdg-open --chooser'
  alias termux-open='termux-open --chooser'
  alias reload='termux-reload-settings && exec zsh'
else
  alias reload='exec zsh'
fi

alias get-repos='~/Dev/sh/get-repos/get-repos.sh'

alias sched='~/Dev/sh/work-sched/work-sched &'

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

alias mc-shots="~/Dev/sh/prism-mc-screenshots/mc-shots"

alias asciiquarium="/usr/bin/asciiquarium -t -s"

# not needed if nvidia setup correctly
#alias godot='godot --rendering-driver opengl3 &'

function welcome_art() {
  random_image=`shuf -n1 -e \`fd . $ZSH_CUSTOM/images/\``
  if grep "#\!/" $random_image &> /dev/null; then
    $random_image
  else
    cat $random_image
  fi
}
welcome_art

alias sort-downloads="~/Dev/python/Organize-by-extensions/main.py"
if [ -d /data/data/com.termux ]; then
  if [[ $(find ~/storage/downloads/ -maxdepth 1 -type f) != "" ]]; then
    sort-downloads
  fi
elif [[ $(find ~/Downloads/ -maxdepth 1 -type f) != "" ]]; then
  sort-downloads
fi
