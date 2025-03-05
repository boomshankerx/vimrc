#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $(realpath $0))
echo $SCRIPT_PATH
cd $SCRIPT_PATH

# Configure
[[ -d ~/.local/bin ]] || mkdir -p ~/.local/bin
[[ -L ~/.local/bin/vimrc  ]] || ln -s ~/vimrc/vimrc ~/.local/bin/vimrc

function backup() {
    echo "Backup configuration"
    tar -zcf ~/vim.`date +"%Y-%m-%d.%H%M%S"`.tgz .vim .vimrc
}

function install() {
    install_config
    install_plugins
}

function install_config() {
    os=`uname`
    echo $os

    exclude="--exclude-from exclude.linux"
    if [[ "$os" == "FreeBSD" ]]; then
        echo "Installing for FreeBSD"
        exclude="--exclude-from exclude.freebsd"
    fi
    
    rsync -rtv $exclude .vim .vimrc ~

    if [[ "$os" == "Darwin" ]]; then
        echo "Installing for Mac"
        sed -i'' -e 's/set guifont=.*/set guifont=DejaVu\\ Sans\\ Mono\\ for\\ Powerline:h11/' ~/.vimrc
    fi
}

function install_plugins() {
    rm -fr ~/.vim/bundle/
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    vam install youcompleteme
}

#Update repo with local config
function sync() {
    echo 'Syncing vim configuration'
    rsync -rtv --delete \
        --exclude-from exclude.linux \
        --exclude=.git \
        --exclude=.vim/autoload \
        --exclude=.vim/bundle \
        --exclude=.vim/doc \
        ~/.vim ~/.vimrc $SCRIPT_PATH
}

#Show usage
function show_help() {
    echo "Usage:"
    echo "-b|--backup  : Backup current config"
    echo "-c|--config  : Install config files"
    echo "-h|--help    : Show this message"
    echo "-i|--install : Install config and plugins"
    echo "-p|--plugins : Install plugins"
    echo "-s|--sync    : Sync repo with local config"
    echo "-y|          : Toggle YCM plugin inside config"
}

OPT=$(getopt -o bchips --long backup,config,help,init,install,sync -- "$@")
[ $? == 0 ] || exit 1
eval set -- "$OPT"

[ $# -gt 1 ] || show_help
while true; do
    case $1 in
        -b|--backup  ) backup;;
        -c|--config  ) install_config;;
        -h|--help    ) show_help;;
        -i|--install ) install;;
        -p|--plugins ) install_plugins;;
        -s|--sync    ) sync;;
        -y           ) toggle_ycm;;
        --           ) shift; break;;
    esac
    shift
done

