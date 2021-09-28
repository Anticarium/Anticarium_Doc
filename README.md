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

# Development setup (Windows)

## QT installation
1. Go to [this](https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4) QT web page and download QT installer
2. Open Qt installer and go through all required steps until you get to _Select components_ page, select custom installation
3. Select Qt 5.15.2 under QT selection
4. Select OpenSSL toolkit in Developer and Design Tools section
5. Install

## CLang formatter setup in QT creator
1. Open Qt creator
2. Help->About Plugins
3. Find `Beautifier`
4. Check `Beautifier` checkbox
5. Close dialog and restart QT creator
6. Go to [this](https://llvm.org/builds/) web page and install LLVM
7. In Qt creator Tools->Options->Beautifier->CLang Format
8. Browse path to CLang format exe, it is probabbly located under `C:\Program Files\LLVM\bin\clang-format.exe`
9. In `Use predefined style` choose `File`
10. Go to General Tab
11. Check `Enable auto format on file save`
12. Under `Tool:` select `ClangFormat`
13. Ok
14. Put `.clang-format` file found here, into your source directory

## VCPKG setup
1. Go to [this](https://visualstudio.microsoft.com/downloads/) web page and install Visual studio Community edition on your machine
2. Go to [this](https://vcpkg.io/en/getting-started.html) web page and setup VCPKG on your machine
3. From cmd go to vcpkg directory
4. `vcpkg install nlohmann-json --triplet=x64-windows`
5. `vcpkg integrate install`

### Passing VCPKG to CMake
Pass `-DCMAKE_TOOLCHAIN_FILE=[path_to_vcpkg_folder]\scripts\buildsystems\vcpkg.cmake`

