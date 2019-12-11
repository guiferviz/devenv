
# My computer!

In this folder I have a series of scripts that allows me to replicate the installation of the most important programs in my local development environment.
The motivation of doing this is to not be afraid of formatting my PC often and also to be able to create a clon of my computer very easy in a different machine.

My computer is running Linux Mint.
I'm pretty sure everything here is going to run also in Ubuntu, but I've never tried it


# How is this folder organized?

In this folder we have 4 scripts, this README and a lot of configuration files (dotfiles).
Let's describe the scripts one by one:

* **install.sh**. Run this script to install the basic programs I use almost everyday.
NOTE: Some of the steps are not automatized yet, so maybe it's better to execute line by line and read the commands to know if you need to do something manually in order to complete the installation.
For example, the NVIDIA drivers are not installed automatically, there is a comment in this file that explains how to install them using the graphical insterface.

* **restore.sh**. Copy all the files from this folder to the respective location in your file system.

* **restore_setup.sh**. Some of the copied files need a littel bit of setup.
For example, the NeoVim plugin installation is done here.

* **save.sh**. Copy the configuration files from your computer to this folder.
No other file apart from the already existing in this folder are copied.
That means that if you create a new file inside the NeoVim config folder in your computer, that file is not going to be copied to the local directory.
You should copy that file manually.

