# vim config
curl -fLo ~/.vimrc https://raw.githubusercontent.com/yttty/dotfiles/main/.vimrc
echo | vim -c "PlugInstall! | qall! "
