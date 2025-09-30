# dotfiles
💾 My dotfiles repository. If you have a suggestion, improvement or question, don't hesitate to open an issue.

## One-line config

1. First, (if you haven't done so,) install the dependencies

    ```bash
    sudo apt update
    sudo apt install git zsh wget curl tmux libssl-dev -y

    # Install Git Credential Manager
    GCM_VERSION=2.6.1
    wget -O gcm-linux_amd64.deb https://github.com/git-ecosystem/git-credential-manager/releases/download/v$GCM_VERSION/gcm-linux_amd64.$GCM_VERSION.deb
    sudo dpkg -i gcm-linux_amd64.deb
    rm gcm-linux_amd64.deb
    ```

2. Then, usually you could setup config by
    - via `curl`

        ```bash
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/bootstrap.sh)"
        ```

    - or via `wget`

        ```bash
        sh -c "$(wget https://raw.githubusercontent.com/yttty/dotfiles/main/bootstrap.sh -O -)"
        ```

3. Lastly, change your default shell to `zsh`
    - *(sudo needed)* via `sudo chsh`

        ```bash
        sudo chsh -s $(which zsh) $(whoami)
        ```

    - *(Password needed)* via `chsh`

        ```bash
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
        ```

    - If neither work, try

        ```bash
        mv ~/.bash_profile ~/.bash_profile.bak
        echo 'export SHELL=/usr/bin/zsh
        [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l' > ~/.bash_profile
        ```

4. *If you decide to use this configuration as is, don't forget to change your name and e-mail address in the `.gitconfig` files.*

## Optional config

### Install Docker

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/optional/docker/install_docker.sh)"
```

### Install Python
- *(Recommended)* via miniconda3

    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/optional/conda/install_miniconda.sh)"
    ```

- via pyenv
    - First, install compile dependencies for python

        ```bash
        sudo apt install -y libssl-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev tk-dev libffi-dev
        ```

    - Then install pyenv

        ```bash
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/optional/pyenv/install_pyenv.sh)"
        ```

    - Then install the appropriate version of Python (e.g., 3.11)

        ```bash
        source ~/.zshrc
        pyenv install 3.11.6
        pyenv global 3.11.6
        ```

### Additional monitoring tools

- Install additional monitoring tools ```sudo apt install glances htop``` (it will also install a system-level ```python3```)

### Special requirements for vim on old OS versions

Vim 8 is required because some wonderful plugins (e.g. [dense-analysis/ale](https://github.com/dense-analysis/ale)) require vim 8. For Ubuntu 18.04 or later releases, vim 8 is the default version, so you can install with ```apt install vim```.

Otherwise, you may need to [compile vim by yourself](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source). This is not hard. The following commands help you compile vim without GUI support and with python support.

*Note: You may need to install build dependencies first, for Ubuntu, use ```sudo apt install cmake ctags build-essential libncurses5-dev libncursesw5-dev```*

```bash
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=\your\prefix \
            --disable-gui \
            --disable-netbeans \
            --enable-multibyte \
            --enable-python3interp \
            --with-features=huge \
            --enable-fail-if-missing
make
make install
```

## Reference
- [A Good Vimrc - Doug Black](https://dougblack.io/words/a-good-vimrc.html)
- [Vim Bootstrap](http://vim-bootstrap.com)
