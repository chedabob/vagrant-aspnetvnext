#!/bin/bash

# preflight
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update

# misc
sudo apt-get -y install unzip

# mono
sudo apt-get -y install Mono-Complete

# libuv

sudo apt-get -y install automake libtool curl
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make 
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

# dnvm

curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
echo "source ~/.dnx/dnvm/dnvm.sh" >> ~/.bashrc

dnvm upgrade

echo "cd to the root of your source, run 'dnu restore' to get the packages, followed by 'dnx . kestrel' to launch the server and it'll be available at localhost:8080"
echo "protip: to quit the kestrel process, just press enter. if that fails, Ctrl+Z followed by 'kill %1' should get rid of it"
