
#push config
alias pushconfig="source /data/data/com.termux/files/home/tdk.termux/Scripts/push-config.sh"
# pull config
alias pullconfig="source /data/data/com.termux/files/home/tdk.termux/Scripts/pull-config.sh"

# ssh
alias myssh="source /data/data/com.termux/files/home/tdk.termux/Scripts/ssh.sh"

# cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

# nvim alias
alias vim='nvim'

# lsd
alias ls='lsd'

# git top level
alias cg='cd `git rev-parse --show-toplevel`'

# git init, commit, push
alias gitinit='git init && git add -A && git commit -m "init"'

# git clone
gitclone() {
	git clone git@github.com:$*
}

# my git
mygit() {
	git clone git@github.com:thederpykrafter/$*
}
