#!/bin/bash
#-----------------------------------------------------------------
set -e

while getopts a:h flag
do
    case "${flag}" in
        a) RPI_IP=${OPTARG};;
        h) echo "Anticarium first time setup script for Ubuntu 20.04 development Virtual Machine
  Arguments:
  -a        local ip address of Raspberry Pi"; 
            exit 0;;
    esac
done

if [ -z "$RPI_IP" ]
then
    >&2 echo "Error: RPI_IP environment variable not set! Use -a flag to pass and set it!"
    exit -1
fi

echo -e "Performing Anticarium setup for Ubuntu 20.04 development Virtual Machine...\n"
cd ${HOME}
echo "export RPI_IP=$RPI_IP" >> .profile
source .profile

#-----------------------------------------------------------------
echo "Updating apt..."
sudo apt update
sudo apt upgrade -y
echo -e "apt successfully updated\n\n"

#-----------------------------------------------------------------
echo "Installing Qt5..."
sudo apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
echo -e "Qt5 successfully installed\n\n"

#-----------------------------------------------------------------
echo "Installing Qt creator..."
sudo apt install -y qtcreator
echo -e "Qt creator successfully installed\n\n"

#-----------------------------------------------------------------
echo "Installing git..."
sudo apt install -y git
echo -e "git successfully installed\n\n"

#-----------------------------------------------------------------
echo "Installing Visual Studio Code..."
mkdir --parents code
cd code
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
files=(*)
sudo dpkg -i ${files[0]}
cd $HOME
rm -rf code
echo -e "Visual Studio Code successfully installed\n\n"

#-----------------------------------------------------------------
echo "Setting up Anticarium_Pi..."
git clone https://github.com/Anticarium/Anticarium_Pi.git
cd Anticarium_Pi
wget "https://raw.githubusercontent.com/cpp-pm/gate/master/cmake/HunterGate.cmake" -O cmake/HunterGate.cmake
cd $HOME
echo -e "Anticarium_Pi successfully set up\n\n"

#-----------------------------------------------------------------
echo "Setting up raspbian toolchain.."
wget "https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz"
sudo tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt
rm raspi-toolchain.tar.gz
echo "export PATH=$PATH:/opt/cross-pi-gcc/bin" >> .profile
source .profile
echo "raspbian toolchain successfully set up\n\n"

#-----------------------------------------------------------------
REBOOT_SECONDS=60
echo "Anticarium setup for buntu 20.04 development Virtual Machine successfully completed! Rebooting after $REBOOT_SECONDS seconds..."
sleep $REBOOT_SECONDS
sudo reboot now