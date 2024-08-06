
if [[ -f /data/data/com.termux/files/home/.termux/termux.properties ]]; then
    # termux dev path
    export dev="/data/data/com.termux/files/home/storage/shared/Documents/Dev/"

    # termux go path
    export PATH=$PATH:/data/data/com.termux/files/home/go/bin
else
    # go path
    export PATH=$PATH:/usr/local/go/bin

    # add app images to path
    export PATH=$PATH:~/Applications

    # nvm
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/bash_completion
    source /usr/share/nvm/install-nvm-exec
fi
