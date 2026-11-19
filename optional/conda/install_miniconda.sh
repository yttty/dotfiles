# Use official installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
# Use installer from China mirror
# wget https://mirrors.bfsu.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/.miniconda
eval "$($HOME/.miniconda/bin/conda shell.zsh hook)"
conda init zsh
# conda config --set auto_activate_base false
rm ~/miniconda.sh