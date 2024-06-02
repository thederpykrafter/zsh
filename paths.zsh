
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
fi
