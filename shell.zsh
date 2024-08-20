ZSH_THEME="cryptic"
CRYPTIC_THEME_SHOW_TIME=true

# cls
alias cls='clear'

# reload zsh
alias reload='source $ZSH_CUSTOM/.zshrc'

alias get-repos='~/Dev/sh/get-repos/get-repos.sh'

alias sched='~/Dev/sh/work-sched/sched'

# nvim alias
alias vim='nvim'
alias vi='nvim'
alias tvi='NVIM_APPNAME=termux-nvim nvim'

function clean_vim() {
  rm -rf .cache/$1 .local/state/$1 .local/share/$1
}

alias godot='godot --rendering-driver opengl3 &'

~/.oh-my-zsh/custom/image.sh
