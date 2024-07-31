# STM32WL Custom PCB Controller

This project contains the firmware for controlling an STM32WL custom PCB. The firmware is loaded onto the microcontroller using an ST-LINK V3 programmer. The code handles various functionalities including UART communication, I2C, SPI, RTC, and data logging to an SD card using FatFS.

## Table of Contents
- [Features](#features)
- [Hardware Requirements](#hardware-requirements)
- [Software Requirements](#software-requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contribution](#contribution)
- [License](#license)

## Features
- **UART Communication**: Asynchronous data reception and processing.
- **RTC Handling**: Real-Time Clock operations including setting and fetching time.
- **I2C Interface**: Communication with sensors (e.g., ICM20948).
- **SPI Interface**: Communication with external devices.
- **Data Logging**: Write accelerometer data and timestamps to an SD card using the FatFS library.
- **LED Indication**: Status indication using an onboard LED.

## Hardware Requirements
- STM32WL Custom PCB
- ST-LINK V3 Programmer
- ICM20948 Accelerometer
- SD Card and SD Card Module
- LEDs and necessary passive components

## Software Requirements
- STM32CubeIDE or any compatible IDE
- STM32CubeMX for generating initialization code
- FatFS library for file system management
- HAL Drivers for STM32WL

## Installation
1. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/stm32wl-custom-pcb-controller.git
    ```
2. **Open the Project**:
   Open the project in STM32CubeIDE or your preferred IDE.
3. **Compile the Code**:
   Build the project to generate the firmware binary.
4. **Load the Firmware**:
   Use ST-LINK V3 to flash the firmware onto the STM32WL custom PCB.

## Usage
1. **Power the Board**:
   Connect the STM32WL custom PCB to a power source.
2. **Run the Application**:
   The firmware will start running automatically. It will initialize peripherals and begin logging data.
3. **Monitoring and Debugging**:
  
