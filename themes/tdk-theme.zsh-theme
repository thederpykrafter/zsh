# Put your custom themes in this folder.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes
#
# Example:

#autoload -Uz vcs_info
#precmd() { vcs_info }

# Git branch
#zstyle ':vcs_info:git:*' formats '%b '

#setopt PROMPT_SUBST

#PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$'
# '%F{green}%*%f' Green timestamp
# %F{blue}%~%f Blue directory
# %F{red}${vcs_info_msg_0_}%f

# $ Prompt symbol
# change color %F{<color>}<what_to_color>%f
# date time %*
# directory %~
# git branch ${vcs_info_msg_o_}
# show $/# if root or not %#

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
PROMPT='%{$fg[NCOLOR]%}%c %F{green}%#%f %{$reset_color%}'
RPROMPT='%{$fg[NCOLOR]%} $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_=""
ZSH_THEME_GIT_PROMPT_=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

