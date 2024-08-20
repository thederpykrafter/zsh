ZSH_THEME="cryptic"
CRYPTIC_THEME_SHOW_TIME=true

# cls
alias cls='clear'

# reload zsh
alias reload='source $ZSH_CUSTOM/.zshrc'

alias get-repos='~/Dev/sh/get-repos/get-repos.sh'

alias sched='~/Dev/sh/work-sched/sched'

if [ -d $PWD/env ]; then
  source env/bin/activate
elif [[ -n $VIRTUAL_ENV ]]; then
  deactivate
fi

~/.oh-my-zsh/custom/image.sh
