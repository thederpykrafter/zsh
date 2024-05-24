# lazygit
alias gg="lazygit"

# git top level
alias cg='cd `git rev-parse --show-toplevel`'

# git init, commit, push
alias gitinit='git init && git add -A && git commit -m "init"'

# .gitignore
alias gitignore='nvim .gitignore'

# git clone
function gitclone() {
	git clone git@github.com:$1.git $2
}

# my git
function mygit() {
	git clone git@github.com:thederpykrafter/$1.git $2
}
