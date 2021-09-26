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
## VCPKG installation
### Nlohmann json installation
### Passing VCPKG to CMake

