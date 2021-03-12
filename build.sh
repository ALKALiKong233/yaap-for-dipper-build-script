#!/bin/bash

# Colors
RED="\033[1;31m" # For errors / warnings
GREEN="\033[1;32m" # For info
YELLOW="\033[1;33m" # For input requests
BLUE="\033[1;36m" # For info
NC="\033[0m" # reset color

prepare(){
    cd ~
    if [ ! -d "yaap" ]; then
    mkdir yaap
    fi
    cd yaap
    repo init -u git://github.com/yaap/manifest.git -b eleven
    rm -rf .repo/local_manifests
    git clone https://github.com/NoobLiROM/local_manifests .repo/local_manifests
    DEVICE="dipper"
    echo "What do you want to do? 1.Build A GAPPS Version 2.Build A VANILLA Version"
    echo "Type your choice here"
    read choice

    if [[ $choice == "1" ]]
    then
        echo "Build GAPPS Version. Variant is Gapps. Build type is HOMEMADE"
        export TARGET_BUILD_GAPPS=true
    else
        echo "Build VANILLA Version. Variant is VANILLA. Build type is HOMEMADE"
        export TARGET_BUILD_GAPPS=false
    fi

    repo sync -j$(nproc --all) --no-tags --no-clone-bundle
}

build(){
    bash build/envsetup.sh
    lunch yaap_dipper-userdebug
    mka installclean
    make yaap -j$(nproc --all)
}

prepare
build
