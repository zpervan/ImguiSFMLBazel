#!/usr/bin/env bash

echo "This script installs all needed dependencies to successfully run Imgui-SFML!"
echo "Run this script with sudo privileges in order to install the libraries"

if [[ `whoami` != root ]]; then
    echo -e " -- \e[31mPlease run this script as root or using sudo\e[0m"
    exit
fi

echo -e " -- \e[33mFetching updates\e[0m"
apt update -qq

echo -e " -- \e[33mInstalling dependencies\e[0m"
apt install -y build-essential libglew-dev libglfw3-dev libglfw3 freeglut3-dev libsfml-dev

echo -e " -- \e[33mInstalling dependencies for Bazel\e[0m"
apt install -y wget unzip zip wget

echo -e " -- \e[33mDownloading Bazel 3.6.0\e[0m"
mkdir temp && cd temp
wget https://github.com/bazelbuild/bazel/releases/download/3.6.0/bazel_3.6.0-linux-x86_64.deb
wget https://github.com/bazelbuild/bazel/releases/download/3.6.0/bazel_3.6.0-linux-x86_64.deb.sha256
sha256sum -c bazel_3.6.0-linux-x86_64.deb.sha256

echo -e " -- \e[33mInstalling Bazel 3.6.0\e[0m"
dpkg -i bazel_3.6.0-linux-x86_64.deb

echo -e " -- \e[33mCleanup\e[0m"
cd .. && rm -rf temp
