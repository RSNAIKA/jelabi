PATH=${PATH}:~/toolchains/google/arm-eabi-4.8/bin/
KERNEL_DIR=$PWD
export USE_CCACHE=1
export CCACHE_DIR=~/android/cache
export ARCH=arm
export SUBARCH=arm
make cyanogenmod_wt88047_defconfig ARCH=arm CROSS_COMPILE=arm-eabi-
make menuconfig
make -j4 ARCH=arm CROSS_COMPILE=arm-eabi-
dtbToolCM -2 -o $KERNEL_DIR/arch/arm/boot/dt.img -s 2048 -p $KERNEL_DIR/scripts/dtc/ $KERNEL_DIR/arch/arm/boot/dts/
echo -e "\n\nCopying zImage to output directory.....\n\n"
echo "File found started to copy files...."
cp /home/abhi/redmi2/elixir/arch/arm/boot/zImage /home/abhi/redmi2/output/Img/raw
echo -e "Copying dt.img to output directory.....\n\n"
echo "File found started to copy files...."
cp /home/abhi/redmi2/elixir/arch/arm/boot/dt.img /home/abhi/redmi2/output/Img/raw
echo "Changing the working dir to " pwd "......"
cd ~/redmi2/output/Img/image
echo "Cleaning up the directory for the fresh build......"
./cleanup.sh
echo "Unpacking boot image now......"
./unpackimg.sh boot.img
echo "Moving and replacing the files for repacking...."
mv /home/abhi/redmi2/output/Img/raw/zImage /home/abhi/redmi2/output/Img/image/boot.img-zImage
mv /home/abhi/redmi2/output/Img/raw/dt.img /home/abhi/redmi2/output/Img/image/boot.img-dtb
echo -e "Done replacing......\n\n"
echo "Now repacking kernel to boot.img..........."
./repackimg.sh
echo "Geting your boot.img file......"
cp /home/abhi/redmi2/output/Img/image/image-new.img /home/abhi/redmi2/output/Img/bootfiles
cd /home/abhi/redmi2/output/Img/bootfiles
name=$(date '+ %d%m%y')
for file in image-new*
do
  mv "$file" "$name${file#image-new}"
done
nautilus /home/abhi/redmi2/output/Img/bootfiles

