# dotfiles
💾 My dotfiles repository. If you have a suggestion, improvement or question, don't hesitate to open an issue.

## System-level setup

1. Install the dependencies

    ```bash
    sudo apt update
    sudo apt install vim nano git git-lfs zsh wget curl iproute2 tmux htop nload libssl-dev libicu-dev -y
    ```

2. Install Git Credential Manager
    ```bash
    GCM_VERSION=2.6.1
    wget -O gcm-linux_amd64.deb https://github.com/git-ecosystem/git-credential-manager/releases/download/v$GCM_VERSION/gcm-linux_amd64.$GCM_VERSION.deb
    sudo dpkg -i gcm-linux_amd64.deb
    rm gcm-linux_amd64.deb
    ```

3. Install Docker
    ```bash
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    ```

4. Add user to docker group
    ```bash
    sudo usermod -aG docker $(whoami)
    ```

## User-level setup

1. Setup user-level config by
    ```bash
    # via curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/bootstrap.sh)"
    ```

    ```bash
    # via wget
    sh -c "$(wget https://raw.githubusercontent.com/yttty/dotfiles/main/bootstrap.sh -O -)"
    ```

2. Change your default shell to `zsh`
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

3. Install Python
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

       - Then install the appropriate version of Python (e.g., 3.14)

           ```bash
           source ~/.zshrc
           pyenv install 3.14.0
           pyenv global 3.14.0
           ```

4. Install node
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/main/optional/node/install_node.sh)"
    ```

5. *If you decide to use this configuration as is, don't forget to change your name and e-mail address in the `.gitconfig` files.*

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
