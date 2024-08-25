# lazygit
alias gg="lazygit"

# git top level
alias cg='cd `git rev-parse --show-toplevel`'

# git init, add, commit
alias gitinit='git init && git add -A && git commit -m "init"'

# git init, add, commit && gh repo create
function ghinit() {
  repo_name=$(echo $PWD | sed "s/\/home\/thederpykrafter\///" | rev | cut -d / -f1 | rev)

  if [ ! -f README.md ]; then
	  touch README.md
	  echo "# $repo_name" &> README.md
  fi

  if [ ! -d .git ]; then
	  git init && git add -A && git commit -m "init"
  fi

  gh repo create $repo_name -s . --push --public #2> /dev/null || echo "Remote for \"$repo_name\" already exists"
}

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

# fuzzy search github repos
function lazyclone() {
  gitclone $(gh repo list -L 200 | awk '{print $1}' | sed "s/thederpykrafter\///" | fzf --query "$*" --preview "")
}

function gittemplate() {
  gh repo create $1 --public --clone --template $2
}

alias nogit="~/Dev/sh/nogit/nogit.sh"
