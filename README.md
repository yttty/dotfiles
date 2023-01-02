# dotfiles
💾 My dotfiles repository. If you have a suggestion, improvement or question, don't hesitate to open an issue.

## One-line config

1. First, (if you haven't done so,) install the dependencies ```sudo apt install git curl zsh```.
2. Then,
    1. usually you could config by:
        - ```sh -c "$(curl -fsSL https://raw.githubusercontent.com/yttty/dotfiles/raw/master/bootstrap.sh)"```
        - ```sh -c "$(wget https://raw.githubusercontent.com/yttty/dotfiles/raw/master/bootstrap.sh -O -)"```
    2. if you are in Mainland China:
        - ```sh -c "$(curl -fsSL https://gitee.com/yttty/dotfiles/raw/master/bootstrap_cn.sh)"```
        - ```sh -c "$(wget https://gitee.com/yttty/dotfiles/raw/master/bootstrap_cn.sh -O -)"```
3. Lastly, change your default shell to `zsh` by ```chsh -s $(grep /zsh$ /etc/shells | tail -1)```
    - If `chsh` doesn't work, try
        ```bash
        mv ~/.bash_profile ~/.bash_profile.bak
        echo 'export SHELL=/usr/bin/zsh
        [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l' > ~/.bash_profile
        ```
4. *If you decide to use this configuration as is, don't forget to change your name and e-mail address in the `.gitconfig` files.*

## Optional config

### Additional monitoring tools

- Install additional monitoring tools ```sudo apt install vim glances htop``` (it will also install system-level ```python3```)

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
