
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ ]; then
  git clone http://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  source ~/.zshrc
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone http://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  source ~/.zshrc
fi