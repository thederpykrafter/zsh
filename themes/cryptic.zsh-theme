#!/usr/bin/env zsh

#======================================================================#
#    _        _                _ _ _         _____ _                   #
#   /_\  _ __| |_  _ _ ___  __| (_) |_ ___  |_   _| |_  ___ _ __  ___  #
#  / _ \| '_ \ ' \| '_/ _ \/ _` | |  _/ -_)   | | | ' \/ -_) '  \/ -_) #
# /_/ \_\ .__/_||_|_| \___/\__,_|_|\__\___|   |_| |_||_\___|_|_|_\___| #
#       |_|                                                            #
#                                                                      #
#                       Aphrodite Terminal Theme                       #
#                 by Sergei Kolesnikov a.k.a. win0err                  #
#                                                                      #
#                        https://kolesnikov.se                         #
#                                                                      #
#======================================================================#


export VIRTUAL_ENV_DISABLE_PROMPT=false
setopt PROMPT_SUBST


cryptic_get_prompt() {
	# virtual environment
    if [[ -v VIRTUAL_ENV ]]; then
		echo -n "%F{7}["$(basename "$VIRTUAL_ENV")"]%f " 
	fi

    # user@host
	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n "┌%f"

    echo -n "%F{6}%n%f" # color=cyan

	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n "─%f" # @ symbol color=grey

	echo -n "%F{12}%m%f" # host name color=blue

	# $(hostname) = Nitro-1
	# $(whoami) = thederpykrafter
	cryptic_user_length=$(echo -n $(whoami) | wc -c)
	cryptic_hostname_length=$(echo -n $(hostname) | wc -c)
	cryptic_divider_length=cryptic_user_length+cryptic_hostname_length+4

	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n ${(l:COLUMNS - cryptic_divider_length::─:)} # divider
	echo -n "┐"

	echo  # new line

	echo -n "│%f" # │ symbol
	echo -n "%F{8}" # : symbol color=blue
	echo -n "%f%3~" # set directory depth with %<number>~
	
    echo  # new line

	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n "└%F{129}%(!.#.$)%f "  # if is_root_user ? # : $ color=purple
}

cryptic_get_rprompt() {
    # git branch
	local git_branch=$(git --no-optional-locks rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [[ -n "$git_branch" ]]; then
        # git status
		local git_status=$(git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)
		[[ -n "$git_status" ]] && echo -n "%F{11}" || echo -n "%F{10}"
		echo -n "‹${git_branch}›%f"
	fi

    # time
	if [[ -v CRYPTIC_THEME_SHOW_TIME ]]; then
		# time format
		echo -n "%F{8}[%D{%H:%M:%S}]%f"
	fi
}

export RPROMPT='$(cryptic_get_rprompt)'
export PROMPT='$(cryptic_get_prompt)'