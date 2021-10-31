# Anticarium

This documentation tells about general Anticarium structure and common setup steps for development and deployment environments.

Here is the list of all repositories needed to launch this project:
- [Anticarium_IC](https://github.com/Anticarium/Anticarium_IC)
- [Anticarium_Pi](https://github.com/Anticarium/Anticarium_Pi)
- [Anticarium_Desktop](https://github.com/Anticarium/Anticarium_Desktop)
- [Shared_Types](https://github.com/Anticarium/Shared_Types)

# About 
Anticarium is smart terrarium meant for cold blooded animals, for example, reptiles, ants, spiders, etc.. Using Anticarium you have an ability to control and track your beloved terrarium remotely using desktop app.
You can monitor humidity, moisture and temperature and set vital environmental parameters for your pet, such as:
- Temperature
- Moisture
- Ventilation
- LED lights

Anticarium also gives you an ability to create and manage your own environment regimes and track your pet 24/7 using video stream from camera.

# System structure
This project consists of four different parts:
1. QT desktop application for linux and windows platforms
2. Server side application that runs on raspberry pi
3. Electronics part that consists of two MCUs
4. Shared_Types C++ json models meant for use in Anticarium_Pi and Anticarium_Desktop

# Technologies used
## Languages and frameworks
1. C++
2. QT
3. Arduino
4. CMake
5. GTests
## Additional technologies
1. VCPKG
2. HunterGate

# Used sources
1. CMake documentation https://cmake.org/cmake/help/v3.21/
2. Qt documentation https://doc.qt.io/qt-5/classes.html
3. HunterGate documentation https://hunter.readthedocs.io/en/latest/index.html
4. Change I2C baud rate for Raspberry Pi https://www.raspberrypi-spy.co.uk/2018/02/change-raspberry-pi-i2c-bus-speed/
5. Bi-directional level shifter for I2C-bus https://cdn-shop.adafruit.com/datasheets/an97055.pdf
6. Raspberry pi I2C library usage https://raspberry-projects.com/pi/programming-in-c/i2c/using-the-i2c-interface
7. Linear interpolation mathematical function https://stackoverflow.com/questions/8684327/c-map-number-ranges#8684356
8. Speedlog documentation and source https://github.com/gabime/spdlog
9. PID algorithm documentation and source https://github.com/nicholastmosher/PID
10. PID algorithm explanation https://www.youtube.com/watch?v=UR0hOmjaHp0

# Development setup (Windows)

## Download and install Visual Studio
1. Go to [this](https://visualstudio.microsoft.com/downloads/) web page and install Visual Studio Community edition on your machine, check C++ for Desktop development

## QT installation
1. Go to [this](https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4) QT web page and download QT installer
2. Open Qt installer and go through all required steps until you get to _Select components_ page, select custom installation
3. Select Qt 5.15.2 and check MSVC compiled versions under QT selection, unched other compiled versions
4. Select OpenSSL toolkit in Developer and Design Tools section
5. Install

## CLang formatter setup in QT creator
1. Open Qt creator
2. Help->About Plugins
3. Find `Beautifier`
4. Check `Beautifier` checkbox
5. Close dialog and restart QT creator
6. In Qt creator Tools->Options->Beautifier->CLang Format
7. Find clang-format executable in Visual Studio folder, it is probabbly located here `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\bin\clang-format.exe`
8. In `Use predefined style` choose `File`
9. Go to General Tab
10. Check `Enable auto format on file save`
11. Under `Tool:` select `ClangFormat`
12. Ok
13. Put `.clang-format-12` file found here, into your source directory and rename to `.clang-format`

## VCPKG setup
1. Go to [this](https://vcpkg.io/en/getting-started.html) web page and setup VCPKG on your machine
2. From cmd go to vcpkg directory
3. `vcpkg install nlohmann-json --triplet=x64-windows`
4. `vcpkg install spdlog --triplet=x64-windows`
5. `vcpkg integrate install`

### Passing VCPKG to CMake
Pass `-DCMAKE_TOOLCHAIN_FILE=[path_to_vcpkg_folder]\scripts\buildsystems\vcpkg.cmake`

# Development setup (Raspbian)

Described in `README.md`, in [Anticarium_Pi](https://github.com/Anticarium/Anticarium_Pi)

# Development setup (Embedded)

Described in `README.md`, in [Anticarium_IC](https://github.com/Anticarium/Anticarium_IC)