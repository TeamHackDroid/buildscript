#!/bin/sh

#Clean Temp Dirs
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/*
rm -rf  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/*
rm -rf  ~/kernel/ADC/temp/ancora_tmo_defconfig/*

#Make Needed Dirs
mkdir  ~/kernel
mkdir  ~/kernel/KKernel
mkdir  ~/kernel/ADC
mkdir  ~/kernel/KKernel/temp/ancora_tmo_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/
mkdir  ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/
mkdir  ~/kernel/ADC/temp/ancora_tmo_defconfig/

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
if [ -f ~/kernel/KKernel/README.md ]; then
    repo sync
else
    repo init -u git@github.com:Christopher83/linaro_toolchains_2014.git -b 2014.08
    repo sync
fi

#Make Default Chris
echo "Making Linaro K^Kernel"
cd ~/kernel/KKernel/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_hm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_hm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_sm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_sm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_vhm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_exuv_vhm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ancora_tmo_oc_exuv_xhm_defconfig
#make
#cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/zImage
#cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/cifs.ko
#cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/dhd.ko
#cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/scsi_wait_scan.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qce.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qcedev.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qcrypto.ko
#make clean

#Make ancora_tmo_oc_uv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_hm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_hm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_sm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_sm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_vhm_defconfig
make
cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/zImage
cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/cifs.ko
cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/dhd.ko
cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/scsi_wait_scan.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/qce.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/qcedev.ko
cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/ancora_tmo_oc_uv_vhm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ancora_tmo_oc_uv_xhm_defconfig
#make
#cp  ~/kernel/KKernel/build/arch/arm/boot/zImage ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/zImage
#cp  ~/kernel/KKernel/build/fs/cifs/cifs.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/cifs.ko
#cp  ~/kernel/KKernel/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/dhd.ko
#cp  ~/kernel/KKernel/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/scsi_wait_scan.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qce.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/qce.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcedev.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/qcedev.ko
#cp  ~/kernel/KKernel/build/drivers/crypto/msm/qcrypto.ko ~/kernel/KKernel/temp/#ancora_tmo_oc_uv_xhm_defconfig/qcrypto.ko
#make clean

#Make Default ADC
#Make ancora_tmo_defconfig
echo "Making Linaro ADC Kernel"
cd ~/kernel/ADC/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/kernel/toolchains/linaro_toolchains_2014-2014.08/arm-cortex_a8-linux-gnueabi-linaro_4.9.2-2014.08/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_defconfig
make
cp  ~/kernel/ADC/build/arch/arm/boot/zImage ~/kernel/ADC/temp/ancora_tmo_defconfig/zImage
cp  ~/kernel/ADC/build/fs/cifs/cifs.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/cifs.ko
cp  ~/kernel/ADC/build/drivers/net/wireless/bcmdhd/dhd.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/dhd.ko
cp  ~/kernel/ADC/build/drivers/scsi/scsi_wait_scan.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/scsi_wait_scan.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qce.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/qce.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qcedev.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/qcedev.ko
cp  ~/kernel/ADC/build/drivers/crypto/msm/qcrypto.ko ~/kernel/ADC/temp/ancora_tmo_defconfig/qcrypto.ko
make clean


