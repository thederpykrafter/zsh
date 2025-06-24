# pywal theme
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"

# cd and source python env if found
function cd() {
	builtin cd $1
	if [ -f .env/bin/activate ]; then
		source .env/bin/activate
	elif [ -f ./../.env/bin/activate ]; then
		source ./../.env/bin/activate
	elif [ -f env/bin/activate ]; then
		source env/bin/activate
	elif [ -f ./../env/bin/activate ]; then
		source ./../env/bin/activate
	elif command -v deactivate &>/dev/null; then
		deactivate
	fi
}
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

# lsd
alias ls='lsd --group-dirs first'

# vim like exit
alias :q='exit'
alias :wq='exit'
