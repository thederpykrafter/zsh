#!/usr/bin/env zsh
#######################################################################################
#                                                                                     #
#         ,gggg,                                                                      #
#       ,88"""Y8b,                                         I8                         #
#      d8"     `Y8                                         I8                         #
#     d8'   8b  d8                                      88888888   gg                 #
#    ,8I    "Y88P'                                         I8      ""                 #
#    I8'             ,gggggg,   gg     gg   gg,gggg,       I8      gg      ,gggg,     #
#    d8              dP""""8I   I8     8I   I8P"  "Yb      I8      88     dP"  "Yb    #
#    Y8,            ,8'    8I   I8,   ,8I   I8'    ,8i    ,I8,     88    i8'          #
#    `Yba,,_____,  ,dP     Y8, ,d8b, ,d8I  ,I8 _  ,d8'   ,d88b,  _,88,_ ,d8,_    _    #
#      `"Y8888888  8P      `Y8 P""Y88P"888 PI8 YY88888P  8P""Y8  8P""Y8 P""Y8888PP    #
#                                    ,d8I'  I8                                        #
#                                  ,dP'8I   I8                                        #
#                                 ,8"  8I   I8                                        #
#                                 I8   8I   I8                                        #
#                                 `8, ,8I   I8                                        #
#                                  `Y8P"    I8                                        #
#                                                                                     #
#######################################################################################
#                                                                                     #
#                 https://github.com/thederpykrafter/cryptic.zsh-theme                #
#                                                                                     #
#                              huge insporation from                                  #
#                 https://github.com/win0err/aphrodite-terminal-theme                 #
#                                                                                     #
#######################################################################################
export VIRTUAL_ENV_DISABLE_PROMPT=false
setopt PROMPT_SUBST

cryptic_get_prompt() {
  # get length of username + hostname + 2 corners + 1 dash + 1 to prevent resizing issues 
	cryptic_user_length=$(echo -n $(whoami) | wc -c)
	cryptic_hostname_length=$(echo -n $(hostname) | wc -c)
	cryptic_divider_length=cryptic_user_length+cryptic_hostname_length+4
  if [[ ! $VIRTUAL_ENV == "" ]]; then
	  cryptic_divider_length=cryptic_user_length+cryptic_hostname_length+9
  fi

  # corner before user
	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n "┌%f"

  # user name
  echo -n "%F{6}%n%f" #color=cyan

  # dash between user & host
	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n "─%f"

	# virtual environment
  if [[ -v VIRTUAL_ENV ]]; then
		echo -n "%F{7}["$(basename "$VIRTUAL_ENV")"]%f" 
	fi

  # line between user and host
	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	echo -n ${(l:COLUMNS - cryptic_divider_length::─:)}

  # host
	echo -n "%F{12}%m%f" # host color=blue

  # corner after host
  echo -n "%(?.%f.%F{1})" # if retcode == 0 ? reset : red
	echo -n "─"

	echo  # new line

  # line before Directory
	echo -n "│%f"

	# directory path
	echo -n "%f%3~" # set depth with %<number>~

  echo  # new line
	echo -n "%(?.%f.%F{1})"  # if retcode == 0 ? reset : red
	# show if user or sudo
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

  # timestamp 12hr HH:MM:SS AM/PM
	if [[ -v CRYPTIC_THEME_SHOW_TIME ]]; then
		echo -n "%F{243}[%D{%r}]%f"
	fi
}

export RPROMPT='$(cryptic_get_rprompt)'
export PROMPT='$(cryptic_get_prompt)'
