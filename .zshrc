if [[ $TTY != /dev/tty1 ]] && [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then
  if tmux ls &>/dev/null; then
    exec tmux new-session
  else
    exec tmux new-session -s main
  fi
fi

zstyle ':omz:*' aliases no
zstyle ':completion:*' menu select
zstyle ':omz:update' mode auto

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.config/zsh/
# ZSH_THEME="cryptic"
# CRYPTIC_THEME_SHOW_TIME=true
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

plugins=(
  git
  git-auto-fetch
  fzf
  copybuffer
  zsh-you-should-use
  zsh-completion-generator
  zsh-autosuggestions
  zsh-autopair
  zsh-syntax-highlighting
  timer
)

source $ZSH/oh-my-zsh.sh
fpath+=~/.zfunc; autoload -Uz compinit; compinit
