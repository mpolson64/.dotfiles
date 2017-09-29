## Git
touch ~/.gitconfig
ln -sfv ~/.dotfiles/git/.gitconfig ~

touch ~/.gitignore
ln -sfv ~/.dotfiles/git/.gitignore ~

## Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

touch ~/.vimrc
ln -sfv ~/.dotfiles/vim/.vimrc ~

mkdir -p ~/.vim
ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

vim +PluginInstall +qall

## Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
ln -sfv ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

nvim +PlugInstall +qall

## Emacs
mkdir -p ~/.emacs.d
touch ~/.emacs.d/init.el
ln -sfv ~/.dotfiles/emacs.d/init.el ~/.emacs.d/init.el
