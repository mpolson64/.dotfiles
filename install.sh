# Git
ln -sfv ~/.dotfiles/git/.gitconfig ~

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sfv ~/.dotfiles/vim/.vimrc ~
ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

vim +PluginInstall +qall
