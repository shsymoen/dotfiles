mkdir -p ~/.vim/
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone --recursive https://github.com/python-mode/python-mode.git ~/.vim/bundle/python-mode
git clone https://github.com/powerline/powerline.git ~/.vim/bundle/powerline
git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && cd 
git clone https://github.com/jmcantrell/vim-virtualenv.git ~/.vim/bundle/vim-virtualenv
ln -s .vimrc ~/.vimrc

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s .tmux.conf ~/.tmux.conf
