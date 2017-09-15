## Git
ln -sfv ~/.dotfiles/git/.gitconfig ~
ln -sfv ~/.dotfiles/git/.gitignore ~

## Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sfv ~/.dotfiles/vim/.vimrc ~
mkdir ~/.vim
ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

vim +PluginInstall +qall

## Neovim
ln -sfv ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

## Emacs
ln -sfv ~/.dotfiles/emacs.d/init.el ~/.emacs.d/init.el
