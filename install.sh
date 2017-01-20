## Git
ln -sfv ~/.dotfiles/git/.gitconfig ~
ln -sfv ~/.dotfiles/git/.gitconfig.local ~

## Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sfv ~/.dotfiles/vim/.vimrc ~
mkdir ~/.vim
ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

vim +PluginInstall +qall

## Emacs
ln -sfv ~/.dotfiles/emacs/.emacs ~
