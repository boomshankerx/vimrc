#!/usr/bin/env bash

###################
# Windows Version #
###################
echo 'Writing windows files'
dir=win
[[ -d "$dir" ]] || mkdir $dir
cp -v .vimrc _vimrc
sed -i -e 's/~\/.vim\//~\/vimfiles\//g' -e 's/.vimrc/_vimrc/g' _vimrc 
sed -i 's/DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ 10/DejaVu_Sans_Mono_for_Powerline:h10:cANSI/' _vimrc
