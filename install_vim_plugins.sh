#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create necessary Vim directories
mkdir -p ~/.vim/{undodir,autoload,bundle,color}

# Define the list of packages to install with full repo paths
packages=(
  "https://github.com/tpo/pathogen.vim.git"
  "https://github.com/scrooloose/nerdtree.git"
  "https://github.com/kien/ctrlp.vim.git"
  "https://github.com/powerline/powerline.git"
  "https://github.com/Valloric/YouCompleteMe.git"
  "https://github.com/jmcantrell/vim-virtualenv.git"
  "https://github.com/dense-analysis/ale.git"
  "https://github.com/tmhedberg/SimpylFold.git"
  "https://github.com/Konfekt/FastFold.git"
  "https://github.com/sainnhe/everforest.git"
  "https://github.com/yuttie/comfortable-motion.vim.git"
  "https://github.com/heavenshell/vim-pydocstring.vim.git"
)

# Install Vim if it's not already installed
if ! command -v vim &> /dev/null; then
  echo "Vim is not installed. Installing Vim..."
  sudo pacman -S vim
fi

# Install each package from the list
for package_url in "${packages[@]}"; do
  package_name=$(basename "${package_url}")
  # Extract the package name from the URL

  if [ ! -d ~/.vim/bundle/$package_name ]; then
    echo "Installing $package_name..."
    git clone ${package_url} ~/.vim/bundle/$package_name
  fi
done

# Install everforest colors and autoload files
if [ -d ~/.vim/bundle/everforest ]; then
  echo "Copying everforest colors and autoload files..."
  cp ~/.vim/bundle/everforest/colors/everforest.vim ~/.vim/colors/
  cp ~/.vim/bundle/everforest/autoload/everforest.vim ~/.vim/autoload/
fi

# Update and install YouCompleteMe
if [ -d ~/.vim/bundle/YouCompleteMe ]; then
  cd ~/.vim/bundle/YouCompleteMe
  echo "Updating and installing YouCompleteMe..."
  git submodule update --init --recursive
  python3 install.py --all
fi

# Install vim-pydocstring
if [ -d ~/.vim/bundle/vim-pydocstring.vim ]; then
  cd ~/.vim/bundle/vim-pydocstring.vim
  echo "Installing vim-pydocstring..."
  make install
fi

# Create link to vimrc
ln -s "$DIR/.vimrc" ~/.vimrc

# Install additional dependencies
echo "Installing additional dependencies..."
conda install black
pip install doq

# Install Tmux plugins
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s "$DIR/.tmux.conf" ~/.tmux.conf

# Replace xfce4-keyboard-shortcuts.xml
echo "Replacing xfce4-keyboard-shortcuts.xml..."
rm ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
ln -s $DIR/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
