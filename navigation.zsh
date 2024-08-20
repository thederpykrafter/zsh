
# cd
function cd() {
  builtin cd $1
  if [ -f env/bin/activate ]; then
    source env/bin/activate
  elif [ -f ./../env/bin/activate ]; then
    source ./../env/bin/activate
  elif command -v deactivate &> /dev/null; then
    deactivate
  fi
}
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

# mkdir & cd
function mkcd() { mkdir $1 && cd $1 }

# lsd
alias ls='lsd'

# vim like exit
alias :q='exit'
