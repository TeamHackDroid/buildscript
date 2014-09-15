#!/bin/sh

#Get number of processors
NPROC=$(nproc)

#Clean Temp Dirs
rm -rf ~/kernel/KKernel/temp/ariesve_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/*
rm -rf ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/*

#Make Needed Dirs
mkdir -p ~/kernel
mkdir -p ~/kernel/KKernel
mkdir -p ~/kernel/KKernel/temp/ariesve_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/
cp -avr ~/kernel/kerneltools/flashscripts/KKernel ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/
mkdir -p ~/kernel/KKernel/temp/ariesve_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules
mkdir -p ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules
mkdir -p ~/kernel/toolchains

#unpack original boot image
unmkbootimg ~/kernel/boot.img 

#Download/Update Kernels
cd ~/kernel/KKernel
if [ -f ~/kernel/KKernel/Makefile ]; then
    repo sync
else
  repo init -u git://github.com/Doadin/kerneltools_manifest -b kkernel
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

#Make Default Chris
echo "Making Linaro K^Kernel"
cd ~/kernel/KKernel/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel ~/kernel/KKernel/temp/ariesve_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/KKernel/temp/ariesve_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_defconfig/
zip -r KKernel-`date +%Y%m%d`-oc.zip ~/kernel/KKernel/temp/ariesve_defconfig
zip -d KKernel-`date +%Y%m%d`-oc.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc.zip KKernel-`date +%Y%m%d`-oc_signed.zip

#Make ariesve_oc_exuv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_hm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-exuv-hm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-exuv-hm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-exuv-hm.zip KKernel-`date +%Y%m%d`-oc-exuv-hm_signed.zip

#Make ariesve_oc_exuv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_sm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel cd ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o cd ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-exuv-sm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-exuv-sm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-exuv-sm.zip KKernel-`date +%Y%m%d`-oc-exuv-sm_signed.zip

#Make ariesve_oc_exuv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_vhm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel cd ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o cd ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-exuv-vhm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-exuv-vhm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-exuv-vhm.zip KKernel-`date +%Y%m%d`-oc-exuv-vhm_signed.zip

#Make ariesve_oc_exuv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ariesve_oc_exuv_xhm_defconfig
#make -j$NPROC
#cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/zImage
#cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/cifs.ko
#cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/dhd.ko
#cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/scsi_wait_scan.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qce.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qcedev.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qcrypto.ko
#make clean
#cd ~/kernel/kerneltools/
#mkbootimg --kernel ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig/boot.img
#cd ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig
#zip -r KKernel-`date +%Y%m%d`-oc-exuv-xhm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig
#zip -d KKernel-`date +%Y%m%d`-oc-exuv-xhm.zip "zImage"
#java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-exuv-xhm.zip KKernel-`date +%Y%m%d`-oc-exuv-xhm_signed.zip

#Make ariesve_oc_uv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_hm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel cd ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o cd ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-uv-hm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-uv-hm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-uv-hm.zip KKernel-`date +%Y%m%d`-oc-uv-hm_signed.zip

#Make ariesve_oc_uv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_sm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel cd ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o cd ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-uv-sm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-uv-sm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-uv-sm.zip KKernel-`date +%Y%m%d`-oc-uv-sm_signed.zip

#Make ariesve_oc_uv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-toolchain/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-toolchain/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_vhm_defconfig
make -j$NPROC
cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/zImage
cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/cifs.ko
cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/dhd.ko
cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/scsi_wait_scan.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qce.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qcedev.ko
cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/kerneltools/
mkbootimg --kernel ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/boot.img
cd ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig
zip -r KKernel-`date +%Y%m%d`-oc-uv-vhm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig
zip -d KKernel-`date +%Y%m%d`-oc-uv-vhm.zip "zImage"
java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-uv-vhm.zip KKernel-`date +%Y%m%d`-oc-uv-vhm_signed.zip

#Make ariesve_oc_uv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ariesve_oc_uv_xhm_defconfig
#make -j$NPROC
#cp ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/zImage
#cp ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/cifs.ko
#cp ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/dhd.ko
#cp ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/scsi_wait_scan.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qce.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qcedev.ko
#cp ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qcrypto.ko
#make clean
#cd ~/kernel/kerneltools/
#mkbootimg --kernel ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig/zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig/boot.img
#cd ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig
#zip -r KKernel`date +%Y%m%d`-oc-uv-xhm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig
#zip -d KKernel-`date +%Y%m%d`-oc-uv-xhm.zip "zImage"
#java -jar ~/kernel/kerneltools/signapk.jar ~/kernel/kerneltools/testkey.x509.pem ~/kernel/kerneltools/testkey.pk8 KKernel-`date +%Y%m%d`-oc-uv-xhm.zip KKernel-`date +%Y%m%d`-oc-uv-xhm_signed.zip


