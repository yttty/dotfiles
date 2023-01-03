#! /bin/sh

# 1. git config
curl -fLo ~/.gitignore https://raw.githubusercontent.com/yttty/dotfiles/master/.gitignore
curl -fLo ~/.gitconfig https://raw.githubusercontent.com/yttty/dotfiles/master/.gitconfig

# 2. zsh oh-my-zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -fLo ~/.zshrc https://raw.githubusercontent.com/yttty/dotfiles/master/.zshrc

# 3. python and conda config
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/.miniconda
eval "$($HOME/.miniconda/bin/conda shell.zsh hook)"
conda init
# conda config --set auto_activate_base false
# ~/.miniconda3/bin/pip install $(curl -fL https://raw.githubusercontent.com/yttty/dotfiles/master/requirements.txt)
# rm -rf ~/.cache/pip/*
rm ~/miniconda.sh

# 4. tmux config
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/yttty/dotfiles/master/.tmux.conf

# 5. Useful scripts
curl -fLo ~/.local/bin/tree --create-dirs https://raw.githubusercontent.com/yttty/dotfiles/master/scripts/tree
chmod u+x ~/.local/bin/tree
curl -fLo ~/.local/bin/diff-so-fancy --create-dirs https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/diff-so-fancy
chmod u+x ~/.local/bin/diff-so-fancy

# 6. vim config
# curl -fLo ~/.vimrc https://raw.githubusercontent.com/yttty/dotfiles/master/.vimrc
# echo | vim -c "PlugInstall! | qall! "
