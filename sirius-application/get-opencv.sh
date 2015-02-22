#!/usr/bin/env bash

# Install OpenCV
# jahausw@umich.edu
# 2014

hash wget 2>/dev/null || {
  echo >&2 "$0: [ERROR] wget is not installed. Aborting."
  exit 1
}

hash unzip 2>/dev/null || {
  echo >&2 "$0: [ERROR] unzip is not installed. Aborting."
  exit 1
}

# Get correct opencv
sudo apt-get install \
  build-essential checkinstall git cmake libfaac-dev libjack-jackd2-dev \
  libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev \
  libtheora-dev libva-dev libvdpau-dev libvorbis-dev libx11-dev libxfixes-dev \
  libxvidcore-dev texi2html yasm zlib1g-dev

open=opencv-
ver=2.4.9
base=${open}${ver}

mkdir -p bits;
cd bits;
wget \
  http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$ver/$base.zip
unzip $base;
cd $base;

# cmake -DWITH_CUDA=ON -DCUDA_ARCH_BIN="3.5"
cmake .
make && make install
cd .. ;

# (optionally) clean up
# rm -rf $base ;
# cd ../ ; rm -rf bits ;
