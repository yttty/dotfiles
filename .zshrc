################ oh-my-zsh configuration ################
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings
export ZSH=$HOME/.oh-my-zsh

# omz auto update
export UPDATE_ZSH_DAYS=182

# omz themes: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# omz completion & correction
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# omz plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git pip conda command-not-found colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# activate omz
source $ZSH/oh-my-zsh.sh

################ functions ################
# alias for git (not included in the official git pulgin)
gclb() { git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done; }
ggraph() { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative; }
gcmu() { git commit -m "chore: update"; }
gce() { git credential-cache exit; }

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

echo_wsl_proxy() {
    HOST_IP=$(ip route | grep default | awk '{ print $3 }')
    WSL_IP=$(hostname -I | awk '{print $1}')

    echo "Host ip:" ${HOST_IP}
    echo "WSL ip:" ${WSL_IP}
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
        echo_wsl_proxy
    else
        echo "Unsupported arguments."
    fi
}

################ nvm configuration ################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

################ user configuration ################
# export LANG="en_US.UTF-8"
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.local/bin:$HOME/.local/lib/node_modules/bin:/usr/local/bin:$PATH"
export MANPATH="$HOME/.local/man:/usr/local/man:$MANPATH"

# override those provided by oh-my-zsh libs, plugins, and themes.
alias l='ls -lAh'
alias cls='clear'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'
alias g='git'
alias proxifier='proxifier linux' # proxy in bare linux
# alias proxifier='proxifier wsl' # proxy in wsl
