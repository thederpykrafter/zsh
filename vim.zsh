# nvim alias
alias vim='nvim'
alias vi='nvim'
alias tvi='NVIM_APPNAME=termux-nvim nvim'

function clean_vim() {
  rm -rf .cache/$1 .local/state/$1 .local/share/$1
}
