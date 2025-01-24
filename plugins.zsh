
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ ]; then
  git clone http://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  source ~/.zshrc
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone http://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  clear
  source ~/.zshrc
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autopair ]; then
  git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
  clear
  source ~/.zshrc
fi

[[ ! -L ~/.zshrc ]] && rm -rf ~/.zshrc && ln -s ~/.oh-my-zsh/custom/.zshrc ~/
