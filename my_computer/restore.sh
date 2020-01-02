# Restore all files/configurations.


echo "Copying bashrc and aliases"
cp .bashrc ~/.
cp .bash_aliases ~/.

echo "Setting guake preferences"
guake --restore-preferences guake.conf

echo "Copying git config file"
cp .gitconfig ~/.

echo "Copying tmux config file"
cp .tmux.conf ~/.

echo "Copying NeoVim config folder"
echo "  You may want to reinstall the nvim plugins after this step..."
rm -rf ~/.config/nvim
cp -r nvim ~/.config/nvim
# Copy rainbow python function definitions.
cp .rbql_init_source.py ~

echo "Execute restore_setup.sh after this script to ensure that all the config"
echo "files are been properly used"

