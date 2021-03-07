#!/bin/bash

cd ~

echo "Choose your OS \n1.Ubuntu 20.04 \n2.Ubuntu 18.04 \n3.Ubuntu 16.04 \n4.Arch"

read choice

ubuntu(){
    sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev brotli
}

arch(){
    sudo yay -S lineageos-devel brolti
}

if [[ $choice == "1" ]]
then
    ubuntu()
fi

if [[ $choice == "2" ]]
then
    ubuntu()
    sudo apt install libwxgtk3.0-dev
fi

if [[ $choice == "3" ]]
then
    ubuntu()
    sudo apt install libwxgtk2.8-dev
fi

if [[ $choice == "4" ]]
then
    arch()
fi

if [ ! -d "bin" ]; then
    mkdir bin
fi

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
PATH="$HOME/bin:$PATH"
