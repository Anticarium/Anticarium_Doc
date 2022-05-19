#!/bin/bash
#-----------------------------------------------------------------
while getopts a:h flag
do
    case "${flag}" in
        a) ANTICARIUM_SERVER_IP=${OPTARG};;
        h) echo "Anticarium first time setup script for Raspberry Pi
  Arguments:
  -a        public ip address of Raspberry Pi's router for WEB server"; 
            exit 0;;
    esac
done

if [ -z "$ANTICARIUM_SERVER_IP" ]
then
    >&2 echo "Error: ANTICARIUM_SERVER_IP environment variable not set! Use -a flag to pass and set it!"
    exit -1
fi

echo -e "Performing Anticarium setup for Raspberry Pi...\n"
cd ${HOME}
echo "export ANTICARIUM_SERVER_IP=$ANTICARIUM_SERVER_IP" >> .profile
source .profile

#-----------------------------------------------------------------
echo "Updating apt..."
sudo apt update

#-----------------------------------------------------------------
echo "Enabling ssh..."
sudo touch /boot/ssh
echo "ssh will be available after next boot\n"

#-----------------------------------------------------------------
echo "Installing cmake..."
sudo apt install -y libssl-dev
mkdir ${HOME}/cmake
cd ${HOME}/cmake
wget https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.sh
wget https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz
tar -xf cmake-3.23.1-linux-x86_64.tar.gz
chmod +x bootstrap
./bootstrap
make
sudo make install
cd ${HOME}
echo -e "cmake successfully installed\n"

#-----------------------------------------------------------------
echo "Installing Qt5..."
sudo apt install -y qt5-default
echo -e "Qt5 successfully installed\n"

#-----------------------------------------------------------------
echo "Installint git..."
sudo apt install -y git
echo -e "git successfully installed\n"

#-----------------------------------------------------------------
echo "Installing apache2..."
sudo apt install -y apache2
echo -e "apache2 successfully installed\n"

#-----------------------------------------------------------------
echo "Installing libapache2-mod-wsgi-py3..."
sudo apt-get install -y libapache2-mod-wsgi-py3
echo -e "libapache2-mod-wsgi-py3 successfully installed\n"

#-----------------------------------------------------------------
echo "Installing python-dev..."
sudo apt-get install -y python-dev
echo -e "python-dev successfully installed\n"

#-----------------------------------------------------------------
echo "Installing flask..."
pip3 install flask
echo -e "flask successfully installed\n"

#-----------------------------------------------------------------
echo "Cloning Anticarium_Web..."
git clone https://github.com/Anticarium/Anticarium_Web.git
echo "export ANTICARIUM_WEB_PATH=/home/pi/Anticarium_Web" >> .profile
source .profile
echo -e "Anticarium_Web successfully cloned\n"

#-----------------------------------------------------------------
echo "Configuring apache2..."
cd ${HOME}/Anticarium_Web
mv anticarium_web.example anticarium_web.conf
sudo mv ./anticarium_web.conf /etc/apache2/sites-available
sudo a2ensite /etc/apache2/sites-available/anticarium_web.conf
sudo service apache2 reload
cd ${HOME}
echo -e "Configured apache2\n"

#-----------------------------------------------------------------
echo "Installing raspicam..."
git clone https://github.com/cedricve/raspicam.git
cd raspicam
mkdir build
cd build
cmake ..
cd ${HOME}
rm -rf raspicam
echo -e "raspicam sucessfully installed\n"

#-----------------------------------------------------------------
REBOOT_SECONDS=60
echo "Anticarium setup for Raspberry Pi successfully completed! Rebooting after $REBOOT_SECONDS seconds..."
sleep $REBOOT_SECONDS
sudo reboot now