#!/bin/sh

#Get number of processors
NPROC=$(nproc)

#Clean Temp Dirs
rm -rf ~/kernel/ADC/temp/ariesve_defconfig/*

#Make Needed Dirs
mkdir -p ~/kernel
mkdir -p ~/kernel/ADC
mkdir -p ~/kernel/ADC/temp/ariesve_defconfig/
mkdir -p ~/kernel/ADC/temp/ariesve_defconfig/system/modules
cp -avr ~/kernel/kerneltools/flashscripts/adc ~/kernel/ADC/temp/ariesve_defconfig/
mkdir -p ~/kernel/toolchains

#unpack original boot image
unmkbootimg ~/kernel/boot.img 

#Download/Update Kernels
cd ~/kernel/ADC/build
if [ -f ~/kernel/ADC/Makefile ]; then
    repo sync
else
  repo init -u git://github.com/Doadin/kerneltools_manifest -b adc
  repo sync
fi
cd ~/kernel/toolchains
if [ -f ~/kernel/toolchains/README.md ]; then
    repo sync
else
  repo init -u git://github.com/Doadin/kerneltools_manifest -b toolchain
  repo sync
fi
##Notes
##zip -R `date +%Y%m%d`.zip *.txt

#Make Default ADC
#Make ariesve_defconfig
echo "Making Linaro ADC Kernel"
cd ~/kernel/ADC/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_defconfig
make -j$NPROC
cp ~/kernel/ADC/build/arch/arm/boot/zImage ~/kernel/ADC/temp/ariesve_defconfig/zImage
cp ~/kernel/ADC/build/fs/cifs/cifs.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/cifs.ko
cp ~/kernel/ADC/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/dhd.ko
cp ~/kernel/ADC/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/ADC/build/drivers/crypto/msm/qce.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qce.ko
cp ~/kernel/ADC/build/drivers/crypto/msm/qcedev.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qcedev.ko
cp ~/kernel/ADC/build/drivers/crypto/msm/qcrypto.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel ~/kernel/ADC/temp/ariesve_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/ADC/temp/ariesve_defconfig/boot.img
cd ~/kernel/ADC/temp/ariesve_defconfig
zip -r ADCKernel-`date +%Y%m%d`-oc.zip ~/kernel/KKernel/temp/ariesve_defconfig
zip -d ADCKernel-`date +%Y%m%d`-oc.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 ADCKernel-`date +%Y%m%d`-oc.zip ADCKernel-`date +%Y%m%d`-oc_signed.zip


