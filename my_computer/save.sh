# This script copy all the important files/configurations in your computer.
# Using these files you can restore the current state of your PC.


echo "Updating bashrc and bash aliases"
cp ~/.bashrc .
cp ~/.bash_aliases .

echo "Saving guake preferences"
guake --save-preferences guake.conf

echo "Saving gitconfig file"
cp ~/.gitconfig .

echo "Saving tmux conf file"
cp ~/.tmux.conf .

echo "Updating existing NeoVim config files"
echo "IMPORTANT: If you add a new config file that is not present in ./nvim"
echo "you will need to copy it manually"
# Update only existing files.
# We need to do this because after the plugin installation a lot of
# files are added to the nvim config folder and I don't want to save
# all those files.
# A downside of this approach is that we cannot detect new files added by
# the user.
rsync -r --update --existing ~/.config/nvim/ nvim/
# Rainbow CSV python functions definition.
cp ~/.rbql_init_source.py .

