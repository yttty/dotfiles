################ proxy functions ################
set_proxy() {
    # $1: PROXY_HTTP
    # $2: PROXY_SOCKS5

    echo "Set system proxy."
    export http_proxy="$1"
    export HTTP_PROXY="$1"
    export https_proxy="$1"
    export HTTPS_proxy="$1"
    export all_proxy="$2"
    export ALL_proxy="$2"

    echo "Set git proxy."
    git config --global http.proxy "$1"
    git config --global https.proxy "$1"
}

unset_proxy() {
    echo "Unset system proxy."
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
    unset all_proxy
    unset ALL_PROXY

    echo "Unset git proxy."
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

echo_proxy() {
    GATEWAY_IP=$(ip route | grep default | awk '{ print $3 }')
    LOCAL_IP=$(hostname -I | awk '{print $1}')

    echo "Gateway ip:" ${GATEWAY_IP}
    echo "Local (WSL) ip:" ${LOCAL_IP}
    echo "Current proxy:" ${HTTP_PROXY}
}

proxifier() {
    if [ "$1" = "wsl" ]; then
        HOST_IP=$(ip route | grep default | awk '{ print $3 }')
        PORT=7890
    elif [ "$1" = "linux" ]; then
        HOST_IP=127.0.0.1
        PORT=7890
    else
        echo "Unsupported platform."
    fi

    PROXY_HTTP="http://${HOST_IP}:${PORT}"
    PROXY_SOCKS5="socks5://${HOST_IP}:${PORT}"

    if [ "$2" = "set" ]; then
        set_proxy $PROXY_HTTP $PROXY_SOCKS5
    elif [ "$2" = "unset" ]; then
        unset_proxy
    elif [ "$2" = "echo" ]; then
        echo_proxy
    else
        echo "Unsupported arguments."
    fi
}
