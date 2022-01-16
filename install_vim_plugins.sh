DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ~/.vim/
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/autoload ~/.vim/bundle
mkdir -p ~/.vim/colors
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/powerline/powerline.git ~/.vim/bundle/powerline
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
cd ~/.vim/bundle/YouCompleteMe && python3 install.py --all
git clone https://github.com/jmcantrell/vim-virtualenv.git ~/.vim/bundle/vim-virtualenv
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale
git clone https://github.com/tmhedberg/SimpylFold.git ~/.vim/bundle/SimpylFold
git clone https://github.com/Konfekt/FastFold.git ~/.vim/bundle/FastFold
git clone https://github.com/sainnhe/everforest.git ~/.vim/bundle/everforest
cp ~/.vim/bundle/everforest/colors/everforest.vim ~/.vim/colors/
cp ~/.vim/bundle/everforest/autoload/everforest.vim ~/.vim/autoload/
git clone https://github.com/yuttie/comfortable-motion.vim.git ~/.vim/bundle/comfortable-motion.vim
git clone https://github.com/heavenshell/vim-pydocstring.git ~/.vim/bundle/vim-pydocstring.vim
cd ~/.vim/bundle/vim-pydocstring.vim && make install
git clone git://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
ln -s $DIR/.vimrc ~/.vimrc

conda install black
pip install doq

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $DIR/.tmux.conf ~/.tmux.conf

rm ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
ln -s $DIR/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
