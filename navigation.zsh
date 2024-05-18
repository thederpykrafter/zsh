
# cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

# mkdir & cd
function mkcd() { mkdir $1 && cd $1 }

# lsd
alias ls='lsd'

# vim like exit
alias :q='exit'