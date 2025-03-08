#!/bin/bash
echo Установка...
su
apt install -y bash coreutils findutils util-linux iproute2 iputils-ping net-tools
apt install build-essential git autoconf automake libtool m4 make gcc g++ clang flex bison libx11-dev libxext-dev libfltk1.3-dev zlib1g-dev libfreetype6-dev
apt install libxrandr-dev libxinerama-dev libxrender-dev libxcursor-dev libxi-dev
apt install curl wget unzip tar
apt install libx11-dev libxext-dev libfltk1.3-dev
git clone --branch wine-10.2 --single-branch https://gitlab.winehq.org/wine/wine.git
cd wine
mkdir build-win64 &&
cd    build-win64 &&

../configure --prefix=/usr --enable-win64 &&

make              &&

cd ..             &&
mkdir build-win32 &&
cd    build-win32 &&

PKG_CONFIG_PATH=/usr/lib32/pkgconfig      \
../configure --prefix=/usr                \
             --with-wine64=../build-win64 &&

make

make install      &&
cd ../build-win64 &&
make install

git clone https://github.com/neugens/flwm95.git
cd flwm95
./configure
make
make install
echo "exec flwm95" > ~/.xinitrc
startx


