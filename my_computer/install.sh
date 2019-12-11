# IMPORTANT: Run as root user.

# Install basic stuff.
sudo apt-get install -y tree curl wget make git

# Install drop-down terminal.
# You can install using the repository but it is an old version.
#sudo apt-get install guake
# If you use the repository to install guake you need to modify manually the settings.
# My settings are: config guake, change to tab N using control + N instead of control + FN
# The new version allows us to export and import settings very easy.
git clone https://github.com/Guake/guake.git
cd guake
# Execute the next lines inside the guake folder.
./scripts/bootstrap-dev-debian.sh run make
make
# Maybe you will need the next 2 lines:
sudo apt install python-pip
pip3 install setuptools
# Install with:
sudo make install

# Install snippeds gist program.
apt-get install snapd
snap install gisto

# Install anydesk for remote desktop and file sharing.
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt-get update
apt-get install anydesk

# Install docker.
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
# Añade la siguiente línea al fichero "/etc/apt/sources.list":
#deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
apt-get update
apt-get -y install docker-ce docker-compose
# Add current user to the docker group.
usermod -aG docker $USER
# Log out and log in is needed for the changes to take effect.

# Install nvidia driver using the graphical interface.
# Install nvidia-docker to use GPUs in docker containers.
distribution=ubuntu18.04
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# Install neovim.
sudo apt-get install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# This font is usefull for NeoVim Airline status bar:
apt-get install fonts-powerline
# Install xclip to use the clipboard from vim.
apt-get install xclip

# Install a simple screen recorder, sometimes useful.
sudo apt install kazam

