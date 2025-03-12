#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $(realpath $0))
DISTRO=$(lsb_release -si)
cd $SCRIPT_PATH
git pull

# Configure
[[ -L ~/.local/bin/vimrc ]] || ln -s ~/vimrc/vimrc ~/.local/bin/vimrc

install_config() {
  git pull -q

  SRC=$(realpath etc)
  DST=$HOME

  # Cleanup existing
  rm -fr $HOME/.vim
  mkdir $HOME/.vim

  echo "[+] Backing up existing config"
  re="s|^$SRC/|$DST/|"
  find $SRC -type f | sed "$re" | while read -r file; do
    temp="$file"
    linked=false
    while [ -n "$temp" ] && [ "$temp" != "$HOME" ]; do
      if [ -L "$temp" ]; then
        linked=true
      fi
      temp=$(dirname "$temp")
    done

    if [[ -f $file ]] && [[ ! -L $file ]] && [[ $linked == false ]]; then
      echo "[+] Backing up: $file"
      echo -n "  "
      mv -v "$file" "$file.bak"
    fi
  done

  echo "[+] Symlinking config files"
  stow -v -d $SRC -t $DST .

}

install_config
