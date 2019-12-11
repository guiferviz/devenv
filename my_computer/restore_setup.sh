# This script should be executed after restore.sh and makes the setup
# of all the copied files.


# Reinstall NeoVim plugins.
nvim +PlugInstall +qall

