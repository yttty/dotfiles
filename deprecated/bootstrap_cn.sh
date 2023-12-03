#! /bin/sh

# 1. git config
curl -fLo ~/.gitignore https://gitee.com/yttty/dotfiles/raw/master/.gitignore
curl -fLo ~/.gitconfig https://gitee.com/yttty/dotfiles/raw/master/.gitconfig

# 2. zsh oh-my-zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
curl -fLo ~/.zshrc https://gitee.com/yttty/dotfiles/raw/master/.zshrc

# 3. python and conda config (TUNA mirror)
wget https://mirrors.bfsu.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/.miniconda
eval "$($HOME/.miniconda/bin/conda shell.zsh hook)"
conda init zsh
# conda config --set auto_activate_base false
curl -fLo ~/.condarc https://gitee.com/yttty/dotfiles/raw/master/.condarc
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# ~/.miniconda3/bin/pip install $(curl -fL https://gitee.com/yttty/dotfiles/raw/master/requirements.txt)
# rm -rf ~/.cache/pip/*
rm ~/miniconda.sh

# 4. tmux config
curl -fLo ~/.tmux.conf https://gitee.com/yttty/dotfiles/raw/master/.tmux.conf

# 5. Useful scripts
curl -fLo ~/.local/bin/tree --create-dirs https://gitee.com/yttty/dotfiles/raw/master/scripts/tree
chmod u+x ~/.local/bin/tree
curl -fLo ~/.local/bin/diff-so-fancy --create-dirs https://gitee.com/yttty/dotfiles/raw/master/scripts/diff-so-fancy
chmod u+x ~/.local/bin/diff-so-fancy

# 6. vim config
# no vim config in CN due to network issus
# curl -fLo ~/.vimrc https://gitee.com/yttty/dotfiles/raw/master/.vimrc
# echo | vim -c "PlugInstall! | qall! "
