if [ -d $ZSH_CUSTOM/plugins/zsh-syntax-highilghting ]; then
  git clone http://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/
  source ~/.zshrc
fi

if [ -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
  git clone http://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/
  source ~/.zshrc
fi
