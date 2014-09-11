#!/bin/sh

#Get number of processors
NPROC=$(nproc)

#Clean Temp Dirs
rm -rf  ~/kernel/KKernel/temp/ariesve_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/*
rm -rf  ~/kernel/ADC/temp/ariesve_defconfig/*

#Make Needed Dirs
mkdir  ~/kernel
mkdir  ~/kernel/KKernel
mkdir  ~/kernel/ADC
mkdir  ~/kernel/KKernel/temp/ariesve_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/
mkdir  ~/kernel/ADC/temp/ariesve_defconfig/
mkdir  ~/kernel/KKernel/temp/ariesve_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules
mkdir  ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules
mkdir  ~/kernel/ADC/temp/ariesve_defconfig/system/modules

#unpack original boot image
unmkbootimg ~/kernel/boot.img 

#Download/Update Kernels
cd ~/kernel/KKernel
if [ -f ~/kernel/KKernel/Makefile ]; then
    repo sync
else
    repo init -u git://github.com:Christopher83/samsung-kernel-msm7x30.git -b cm-11.0
    repo sync
fi
cd ~/kernel/ADC
if [ -f ~/kernel/ADC/Makefile ]; then
    repo sync
else
    repo init -u git://github.com:AriesVE-DevCon-TEAM/samsung-kernel-msm7x30.git -b cm-11.0
    repo sync
fi
cd ~/kernel/toolchains
if [ -f ~/kernel/toolchains/README.md ]; then
    repo sync
else
    repo init -u git@github.com:Christopher83/linaro_toolchains_2014.git -b 2014.08
    repo sync
fi
##Notes
##zip -R `date +%Y%m%d_%H%M`.zip *.txt

#Make Default Chris
echo "Making Linaro K^Kernel"
cd ~/kernel/KKernel/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_defconfig/
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc.zip ~/kernel/KKernel/temp/ariesve_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc.zip "zImage"

#Make ariesve_oc_exuv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_hm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-exuv-hm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_hm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-exuv-hm.zip "zImage"

#Make ariesve_oc_exuv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_sm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-exuv-sm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_sm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-exuv-sm.zip "zImage"

#Make ariesve_oc_exuv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_exuv_vhm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-exuv-vhm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_vhm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-exuv-vhm.zip "zImage"

#Make ariesve_oc_exuv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ariesve_oc_exuv_xhm_defconfig
#make -j$NPROC
#cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/zImage
#cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/cifs.ko
#cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/dhd.ko
#cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/scsi_wait_scan.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qce.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qcedev.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ariesve_oc_exuv_xhm_defconfig/system/modules/qcrypto.ko
#make clean
#cd ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig
#"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
#zip -r KKernel-`date +%Y%m%d_%H%M`-oc-exuv-xhm.zip ~/kernel/KKernel/temp/ariesve_oc_exuv_xhm_defconfig
#zip -d KKernel-`date +%Y%m%d_%H%M`-oc-exuv-xhm.zip "zImage"

#Make ariesve_oc_uv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_hm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-uv-hm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_hm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-uv-hm.zip "zImage"

#Make ariesve_oc_uv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_sm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-uv-sm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_sm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-uv-sm.zip "zImage"

#Make ariesve_oc_uv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_oc_uv_vhm_defconfig
make -j$NPROC
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r KKernel-`date +%Y%m%d_%H%M`-oc-uv-vhm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_vhm_defconfig
zip -d KKernel-`date +%Y%m%d_%H%M`-oc-uv-vhm.zip "zImage"

#Make ariesve_oc_uv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ariesve_oc_uv_xhm_defconfig
#make -j$NPROC
#cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/zImage
#cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/cifs.ko
#cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/dhd.ko
#cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/scsi_wait_scan.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qce.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qcedev.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ariesve_oc_uv_xhm_defconfig/system/modules/qcrypto.ko
#make clean
#cd ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig
#"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
#zip -r KKernel`date +%Y%m%d_%H%M`-oc-uv-xhm.zip ~/kernel/KKernel/temp/ariesve_oc_uv_xhm_defconfig
#zip -d KKernel-`date +%Y%m%d_%H%M`-oc-uv-xhm.zip "zImage"

#Make Default ADC
#Make ariesve_defconfig
echo "Making Linaro ADC Kernel"
cd ~/kernel/ADC/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ariesve_defconfig
make -j$NPROC
cp  ~/kernel/ADC/build/arch/arm/boot/zImage ~/kernel/ADC/temp/ariesve_defconfig/zImage
cp  ~/kernel/ADC/build/fs/cifs/cifs.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/cifs.ko
cp  ~/kernel/ADC/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/dhd.ko
cp  ~/kernel/ADC/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/scsi_wait_scan.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qce.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qce.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qcedev.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qcedev.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qcrypto.ko ~/kernel/ADC/temp/ariesve_defconfig/system/modules/qcrypto.ko
make clean
cd ~/kernel/ADC/temp/ariesve_defconfig
"~/kernel/kernel tools/mkbootimg" --kernel zImage --ramdisk ~/kernel/initramfs.cpio.gz --base 0x00400000 --pagesize 4096 --cmdline 'init=/sbin/init root=/dev/ram rw initrd=0x11000000,16M console=ttyDCC0 mem=88M ip=dhcp' -o boot.img
zip -r ADCKernel-`date +%Y%m%d_%H%M`-oc.zip ~/kernel/KKernel/temp/ariesve_defconfig
zip -d ADCKernel-`date +%Y%m%d_%H%M`-oc.zip "zImage"


