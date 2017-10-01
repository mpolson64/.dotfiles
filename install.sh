## Git
while true; do
    read -p "Configure git? [Y/n]" yn
    case $yn in
        [Yy]* )
            touch ~/.gitconfig
            ln -sfv ~/.dotfiles/git/.gitconfig ~

            touch ~/.gitignore
            ln -sfv ~/.dotfiles/git/.gitignore ~
            break;;
        [Nn]* )
            echo "Git skipped"
            break;;
        * )
            echo "Please answer y or n"
    esac
done

## Vim
while true; do
    read -p "Configure vim? [Y/n]" yn
    case $yn in
        [Yy]* )
            git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

            touch ~/.vimrc
            ln -sfv ~/.dotfiles/vim/.vimrc ~

            mkdir -p ~/.vim
            ln -sfv ~/.dotfiles/vim/vundle.vim ~/.vim

            vim +PluginInstall +qall

            break;;

        [Nn]* )
            echo "Vim skipped"
            break;;

        * )
            echo "Please answer y or n"
    esac
done

## Neovim
while true; do
    read -p "Configure neovim? [Y/n]" yn
    case $yn in
        [Yy]* )
            curl -flo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            pip3 install neovim

            mkdir -p ~/.config/nvim
            touch ~/.config/nvim/init.vim
            ln -sfv ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

            nvim +PlugInstall +qall
            break;;

        [Nn]* )
            echo "Neovim skipped"
            break;;

        * )
            echo "Please answer y or n"
    esac
done

## Emacs
while true; do
    read -p "Configure EMACS? [Y/n]" yn
    case $yn in
        [Yy]* )
            mkdir -p ~/.emacs.emacs
            touch ~/.emacs.d/init.el
            ln -sfv ~/.dotfiles/emacs.d/init.el ~/.emacs.d/init.el
            break;;

        [Nn]* )
            echo "EMACS skipped"
            break;;

        * )
            echo "Please answer y or n"
    esac
done


exit
