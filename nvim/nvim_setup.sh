# Add the PPA for neovim
echo "Installing dependencies for adding PPA"
sudo apt-get install -y software-properties-common
echo "Adding neovim PPA"
sudo add-apt-repository -y ppa:neovim-ppa/stable
echo "Updating software sources"
sudo apt-get update
# Install python dependencies
echo "Updating software sources"
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
# Install neovim
echo "Installing neovim"
sudo apt-get install -y neovim

# Setup neovim config directories
echo "Creating config directories"
mkdir -p $HOME/.config/nvim/bundle
mkdir -p $HOME/.config/nvim/colors
# Pull config files
echo "Pulling config files from Github"
wget https://raw.githubusercontent.com/kanishkaganguly/dotfiles/master/nvim/init.vim -O $HOME/.config/nvim/init.vim
wget https://raw.githubusercontent.com/kanishkaganguly/dotfiles/master/nvim/colors/gruvbox.vim -O $HOME/.config/nvim/colors/gruvbox.vim
# Python setup for neovim
sudo -H python2 -m pip install neovim 
sudo -H python3 -m pip install neovim 
# Setup vundle plugin manager
echo "Installing vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim
# Run plugin install for vundle
echo "Setting up vundle plugins"
nvim +PluginInstall +qall
nvim +UpdateRemotePlugins +qall