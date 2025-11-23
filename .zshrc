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
# ENABLE_CORRECTION="true"

# omz plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# activate omz
source $ZSH/oh-my-zsh.sh

################ system environment ################

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export PATH=$HOME/.local/bin:$HOME/.local/share/diff-so-fancy:$HOME/.local/lib/node_modules/bin:/usr/local/bin:$PATH
export MANPATH="$HOME/.local/man:/usr/local/man:$MANPATH"

################ alias configuration ################
# override those provided by oh-my-zsh libs, plugins, and themes.
alias l='ls -lAh'
alias ll='ls -lh'
alias cls='clear'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'

# alias for git
gclb() { git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done; }
gcmu() { git commit -m "chore: update"; }
gce() { git credential-cache exit; }
gaa() { git add --all; }
gd() { git diff; }
gdc() { git diff --cached; }
ggraph() { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative; }
gfind() { git log --grep $1; } # Grep in commit message
ghist() { git log -p -M --follow --stat $1; } # History of a file
gsha() { git rev-parse HEAD; }
gst() { git status; }
gtop() { git log --stat -n 1; }
gb() { git branch; }
gba() { git branch --all; }
gbd() { git branch --delete $1; }
alias g='git'
alias gl='git pull'
alias gp='git push'
alias gg='ggraph'
alias gbgd='LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -d'
alias gbgD='LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -D'
alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbg='LANG=C git branch -vv | grep ": gone\]"'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcbd='git checkout -b dev'
alias gcd='git checkout dev'
alias gcB='git checkout -B'
alias gcm='git checkout main'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gclean='git clean --interactive -d'
alias gcl='git clone --recurse-submodules'
alias gclf='git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias gcmm='git commit -m'
alias glg='git log'
alias glp='git log -p'
alias gll='git log --stat'

################ git-credential-manager configuration ################
export GCM_CREDENTIAL_STORE=cache
export GCM_CREDENTIAL_CACHE_OPTIONS="--timeout 900"

################ proxifier configuration ################
source ${ZSH_PLUGIN}/proxifier/proxifier.sh
alias proxifier='proxifier linux' # proxy in bare linux
# alias proxifier='proxifier wsl' # proxy in wsl
