#!/usr/bin/env bash

function backup() {
    echo "Backup configuration"
    tar -zcf ~/vim.`date +"%Y-%m-%d.%H%M%S"`.tgz .vim .vimrc
}

function convert() {
    echo "Converting windows files"
    cp -v .vimrc _vimrc
    sed -i'' -e "s@call vundle#rc()@call vundle#rc('\$HOME/vimfiles/bundle')@" _vimrc
    sed -i'' -e 's/~\/.vim\//~\/vimfiles\//g' _vimrc
    sed -i'' -e 's/.vimrc/_vimrc/g' _vimrc 
    sed -i'' -e 's/set guifont=.*/set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI/' _vimrc
}

function init() {
    echo "Running init..."
    rm -fr ~/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +PluginInstall +qall
    ~/.vim/bundle/YouCompleteMe/install.py
}

function install() {
    os=`uname`
    echo $os

    exclude="--exclude-from exclude.linux"
    if [[ "$os" == "FreeBSD" ]]; then
        echo "Installing for FreeBSD"
        exclude="--exclude-from exclude.freebsd"
    fi
    
    rsync -rv --delete --delete-excluded $exclude .vim .vimrc ~

    if [[ "$os" == "Darwin" ]]; then
        echo "Installing for Mac"
        sed -i'' -e 's/set guifont=.*/set guifont=DejaVu\\ Sans\\ Mono\\ for\\ Powerline:h11/' ~/.vimrc
    fi

    init
}

#Update repo with local config
function update() {
    echo 'Syncing vim configuration'
    rsync -rtvz --delete --delete-excluded \
        --exclude=.git \
        --exclude=.vim/bundle \
        ~/.vim ~/.vimrc .
    convert
}

#Show usage
function show_help() {
    echo "Usage:"
    echo "   --init    : Wipe installed plugins and reload"
    echo "-b|--backup  : Backup current config"
    echo "-c|--convert : Convert config to win / mac"
    echo "-h|--help    : Show this message"
    echo "-i|--install : Install config files and build plugins"
    echo "-u|--update  : Update repo with local config"
}

OPT=$(getopt -o bchiu --long backup,convert,help,init,install,update -- "$@")
[ $? == 0 ] || exit 1
eval set -- "$OPT"

[ $# -gt 1 ] || show_help
while true; do
    case $1 in
           --init    ) init;;
        -b|--backup  ) backup;;
        -c|--convert ) convert;;
        -h|--help    ) show_help;;
        -i|--install ) install;;
        -u|--update  ) update;;
        --           ) shift; break;;
    esac
    shift
done

