# checkPlugin "author/plugin"
function checkPlugin() {
	author=`echo $1 | sed 's/\/.*//'`
	plugin=`echo $1 | sed 's/.*\///'`
	if [ ! -d ~/.config/zsh/plugins/$plugin ]; then
		gh repo clone $author/$plugin ~/.config/zsh/plugins/$plugin
		source ~/.zshrc
		clear -x
	fi
}

checkPlugin "zsh-users/zsh-syntax-highlighting"
checkPlugin "zsh-users/zsh-autosuggestions"
checkPlugin "hlissner/zsh-autopair"
checkPlugin "MichaelAquilina/zsh-you-should-use"

# timer
TIMER_FORMAT="[%d]"
TIMER_PRECISION=1
TIMER_THRESHOLD=0
