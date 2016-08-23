#!/usr/bin/env bash

###################
# Windows Version #
###################
echo 'Writing windows files'
cp -v .vimrc _vimrc
sed -i '' -e 's/~\/.vim\//~\/vimfiles\//g' _vimrc
sed -i '' -e 's/.vimrc/_vimrc/g' _vimrc 
sed -i '' -e 's/set guifont=.*/set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI/' _vimrc
