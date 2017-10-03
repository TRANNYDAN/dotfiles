#!/bin/bash

# dotfiles directory
dir=$(find ~/ -type d -name "dotfiles")

# old dotfiles backup directory
olddir=$HOME/dotfiles_old             

# list of files/folders to symlink in homedir
files=".bashrc .tmux.conf .tmux .profile"        

# create dotfiles_old in homedir
if [ "$(ls ~/ | grep dotfiles_old)" = "dotfiles_old" ]
  then
    :
  else
    echo -e "\nCreating $olddir for backup of any existing dotfiles in ~ $olddir"
    mkdir -p $olddir
    echo -e "...done \n"
fi

# change to the dotfiles directory
if [ "$(pwd)" = "$dir" ]
  then
    :
  else
    echo -e "\nChanging to the $dir directory"
    cd $dir
    echo -e "...done \n"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo -e "\nRemoving symlinks to $file in home directory."
    unlink ~/$file	 
    echo -e "Moving any existing dotfiles from ~ to $olddir/$file.bak.$(date +%F_%R)"
    cp -r $dir/$file $olddir/$file.bak.$(date +%F_%R)
    echo -e "Creating symlink to $file in home directory. \n"
    ln -s $dir/$file ~/$file
done

source ~/.bash_profile
