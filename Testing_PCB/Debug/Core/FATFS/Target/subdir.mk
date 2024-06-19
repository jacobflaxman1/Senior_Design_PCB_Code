################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/App/app_fatfs.c \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/diskio.c \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/ff.c \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/option/syscall.c \
/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c \
../Core/FATFS/Target/user_diskio_spi.c 

OBJS += \
./Core/FATFS/Target/app_fatfs.o \
./Core/FATFS/Target/diskio.o \
./Core/FATFS/Target/ff.o \
./Core/FATFS/Target/ff_gen_drv.o \
./Core/FATFS/Target/syscall.o \
./Core/FATFS/Target/user_diskio.o \
./Core/FATFS/Target/user_diskio_spi.o 

C_DEPS += \
./Core/FATFS/Target/app_fatfs.d \
./Core/FATFS/Target/diskio.d \
./Core/FATFS/Target/ff.d \
./Core/FATFS/Target/ff_gen_drv.d \
./Core/FATFS/Target/syscall.d \
./Core/FATFS/Target/user_diskio.d \
./Core/FATFS/Target/user_diskio_spi.d 


# Each subdirectory must supply rules for building sources it contributes
Core/FATFS/Target/app_fatfs.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/App/app_fatfs.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/diskio.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/diskio.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/ff.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/ff.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/ff_gen_drv.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/ff_gen_drv.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/syscall.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/Middlewares/Third_Party/FatFs/src/option/syscall.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/user_diskio.o: /Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/FATFS/Target/%.o Core/FATFS/Target/%.su Core/FATFS/Target/%.cyclo: ../Core/FATFS/Target/%.c Core/FATFS/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../Core/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc -I../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../Drivers/CMSIS/Include -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/ffconf.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.c" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/Testing_PCB/Core/FATFS/Target/user_diskio_spi.h" -include"/Users/jacobflaxman/Downloads/STM32Cube_FW_WL_V1.3.0/Projects/NUCLEO-WL55JC/Applications/LoRaWAN/LoRaWAN_AT_Slave/STM32CubeIDE/LoRaWAN_End_Node/LoRaWAN_End_Node/FATFS/Target/user_diskio.c" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-FATFS-2f-Target

clean-Core-2f-FATFS-2f-Target:
	-$(RM) ./Core/FATFS/Target/app_fatfs.cyclo ./Core/FATFS/Target/app_fatfs.d ./Core/FATFS/Target/app_fatfs.o ./Core/FATFS/Target/app_fatfs.su ./Core/FATFS/Target/diskio.cyclo ./Core/FATFS/Target/diskio.d ./Core/FATFS/Target/diskio.o ./Core/FATFS/Target/diskio.su ./Core/FATFS/Target/ff.cyclo ./Core/FATFS/Target/ff.d ./Core/FATFS/Target/ff.o ./Core/FATFS/Target/ff.su ./Core/FATFS/Target/ff_gen_drv.cyclo ./Core/FATFS/Target/ff_gen_drv.d ./Core/FATFS/Target/ff_gen_drv.o ./Core/FATFS/Target/ff_gen_drv.su ./Core/FATFS/Target/syscall.cyclo ./Core/FATFS/Target/syscall.d ./Core/FATFS/Target/syscall.o ./Core/FATFS/Target/syscall.su ./Core/FATFS/Target/user_diskio.cyclo ./Core/FATFS/Target/user_diskio.d ./Core/FATFS/Target/user_diskio.o ./Core/FATFS/Target/user_diskio.su ./Core/FATFS/Target/user_diskio_spi.cyclo ./Core/FATFS/Target/user_diskio_spi.d ./Core/FATFS/Target/user_diskio_spi.o ./Core/FATFS/Target/user_diskio_spi.su

.PHONY: clean-Core-2f-FATFS-2f-Target

