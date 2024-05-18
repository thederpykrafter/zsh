
# ocaml configuration
if [[ -f /data/data/com.termux/files/home/.termux/termux.properties ]]; then
    return
else
    [[ ! -r /home/thederpykrafter/.opam/opam-init/init.zsh ]] || source /home/thederpykrafter/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
fi