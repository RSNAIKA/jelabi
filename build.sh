PATH=${PATH}:/home/abhi/android/kernel/toolchains/google/arm-eabi-4.8/bin/
export ARCH=arm
make cyanogenmod_wt88047_defconfig ARCH=arm CROSS_COMPILE=arm-eabi-
make ARCH=arm CROSS_COMPILE=arm-eabi-
make -j4
