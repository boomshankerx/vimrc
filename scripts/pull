#!/bin/bash

for arg in $@
do
	case $arg in
		-b|--backup)
			echo 'Backing up current configuration'
			tar -zcf archive/vim_`date +"%Y-%m-%d_%H%M%S"`.tgz .vim .vimrc .gvimrc
			rm -r .vim.bak
			mv .vim .vim.bak
			;;
	esac
done

echo 'Syncing vim configuration'
rsync -rtvz --delete --delete-excluded --exclude=.git ~/.vim ~/.vimrc .
. convert.sh
echo `date` >> log.txt
