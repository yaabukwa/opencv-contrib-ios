#!/usr/bin/env bash
set -e

export OCV_VER="4.6.0"
export CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

function install_prerequisites {
    export NONINTERACTIVE=1

    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        echo -e "Homebrew was not found. Will install..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo -e "Homebrew was found. Will update/upgrade..."
        brew update && brew upgrade
    fi

    echo -e "Installing required packages..."
    brew install cmake git python3
}

function prepare_compiler {
    # Enable Xcode tools
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

    # Accept license
    sudo xcodebuild -license accept
}

function download_extract {
    curl -o opencv-${OCV_VER}.tar.gz -L "https://github.com/opencv/opencv/archive/refs/tags/${OCV_VER}.tar.gz"
    curl -o opencv_contrib-${OCV_VER}.tar.gz -L "https://github.com/opencv/opencv_contrib/archive/refs/tags/${OCV_VER}.tar.gz"
    tar xf opencv-${OCV_VER}.tar.gz
    tar xf opencv_contrib-${OCV_VER}.tar.gz
}

function build_xframework {
    echo -e "Using Xcode from: "
    xcode-select -p

    python3 opencv-${OCV_VER}/platforms/apple/build_xcframework.py \
            --framework_name opencv2 \
            --out ./opencv-build \
            --contrib opencv_contrib-${OCV_VER} \
            --iphoneos_archs arm64 \
            --iphonesimulator_archs x86_64,arm64 \
            --build_only_specified_archs \
            --without objc \
            --without alphamat \
            --without cvv \
            --without freetype \
            --without hdf \
            --without java \
            --without julia \
            --without matlab \
            --without ovis \
            --without python2 \
            --without python3 \
            --without sfm \
            --without superres \
            --without ts \
            --without viz \
            --without datasets \
            --without dnn \
            --without dnn_objdetect \
            --without dnn_superres \
            --without wechat_qrcode
}

function zip_package {
    cd ./opencv-build 
    zip -r opencv_contrib-${OCV_VER}-ios.zip opencv2.xcframework
    cd ..
    mv ./opencv-build/opencv_contrib-${OCV_VER}-ios.zip .
}

#install_prerequisites
type curl grep sed tr brew cmake git python3 2>&1
#prepare_compiler
#download_extract
build_xframework
zip_package