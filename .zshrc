if [[ $TTY != /dev/tty1 ]] && [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then
  exec tmux
fi

zstyle ':omz:*' aliases no
zstyle ':completion:*' menu select
zstyle ':omz:update' mode auto

export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=$HOME/.config/zsh/
ZSH_THEME="cryptic"
CRYPTIC_THEME_SHOW_TIME=true

plugins=(
  git
  git-auto-fetch
  fzf
  copybuffer
  zsh-you-should-use
  zsh-autosuggestions
  zsh-autopair
  zsh-syntax-highlighting
  timer
)

source $ZSH/oh-my-zsh.sh
fpath+=~/.zfunc; autoload -Uz compinit; compinit
