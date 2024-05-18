
if [[ -f /data/data/com.termux/files/home/.termux/termux.properties ]]; then
    export dev="/data/data/com.termux/files/home/storage/shared/Documents/Dev/"
    export PATH=$PATH:/data/data/com.termux/files/home/go/bin
else
    # windows paths
    export PATH=$PATH:/usr/local/go/bin
fi