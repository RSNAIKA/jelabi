PATH=${PATH}:~/kernel/toolchains/google/arm-eabi-4.8/bin/
export ARCH=arm
make cyanogenmod_wt88047_defconfig ARCH=arm CROSS_COMPILE=arm-eabi-
make -j4 ARCH=arm CROSS_COMPILE=arm-eabi-
