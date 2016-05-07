## Git
ln -sfv ~/.dotfiles/git/.gitconfig ~

## Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sfv ~/.dotfiles/vim/.vimrc ~
mkdir ~/.vim
ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

# Add powerline patched fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

vim +PluginInstall +qall
