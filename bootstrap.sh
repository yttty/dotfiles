#! /bin/sh

# 1. zsh and oh-my-zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -fLo ~/.zshrc https://raw.githubusercontent.com/yttty/dotfiles/main/.zshrc

# 2. git config
curl -fLo ~/.gitignore https://raw.githubusercontent.com/yttty/dotfiles/main/.gitignore
curl -fLo ~/.gitconfig https://raw.githubusercontent.com/yttty/dotfiles/main/.gitconfig
git-credential-manager configure

# 3. nvm, nodejs, and diff-so-fancy
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
nvm use node
npm install -g diff-so-fancy

# 4. tmux config
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/yttty/dotfiles/main/.tmux.conf

# 5. vim config
curl -fLo ~/.vimrc https://raw.githubusercontent.com/yttty/dotfiles/main/.vimrc
echo | vim -c "PlugInstall! | qall! "
