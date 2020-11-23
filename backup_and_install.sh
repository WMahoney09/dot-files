#!/bin/bash
############################

########## Variables
timestamp=`date +%Y-%m-%d_%H-%M-%S`
dir=~/dotfiles                    # dotfiles directory
backupdir=~/dotfile_backups             # old dotfiles backup directory


# list of files/folders to symlink in homedir
files="bashrc vimrc vim zshrc oh-my-zsh"

##########

# create dotfiles_old in homedir
echo "Creating $backupdir for backup of any existing dotfiles in ~"
mkdir -p $backupdir
mkdir -p $backupdir/$timestamp/
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving .$file from ~ to $backupdir/$timestamp"
    mv ~/.$file ~/$backupdir/$timestamp/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
