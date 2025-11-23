#! /bin/sh

# zsh and oh-my-zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -fLo ~/.zshrc https://raw.githubusercontent.com/yttty/dotfiles/main/.zshrc

# proxifier
PLUGIN_ROOT=~/.plugins
mkdir -p ${PLUGIN_ROOT}
PROXIFIER_DIR=${PLUGIN_ROOT}/proxifier
mkdir -p ${PROXIFIER_DIR}
curl -fLo ${PROXIFIER_DIR}/proxifier.sh https://raw.githubusercontent.com/yttty/dotfiles/main/optional/proxifier/proxifier.sh

# diff-so-fancy
mkdir -p ~/.local/share/diff-so-fancy/lib
curl -fsSL "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/refs/heads/next/diff-so-fancy" \
        -o ~/.local/share/diff-so-fancy/diff-so-fancy
curl -fsSL "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/refs/heads/next/lib/DiffHighlight.pm" \
        -o ~/.local/share/diff-so-fancy/lib/DiffHighlight.pm
chmod +x ~/.local/share/diff-so-fancy/diff-so-fancy

# git config
curl -fLo ~/.gitignore https://raw.githubusercontent.com/yttty/dotfiles/main/.gitignore
curl -fLo ~/.gitconfig https://raw.githubusercontent.com/yttty/dotfiles/main/.gitconfig
git-credential-manager configure

# tmux config
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/yttty/dotfiles/main/.tmux.conf

# vim config
curl -fLo ~/.vimrc https://raw.githubusercontent.com/yttty/dotfiles/main/.vimrc
