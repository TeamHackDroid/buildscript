#!/bin/sh

#Make Default Chris
echo "Making Linaro K^Kernel"
cd /home/doadin/Desktop/kernel/chris/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_hm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_hm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_sm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_sm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_exuv_vhm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_exuv_vhm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_exuv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ancora_tmo_oc_exuv_xhm_defconfig
#make
#cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/zImage
#cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/cifs.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/dhd.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/scsi_wait_scan.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qce.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qcedev.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_exuv_xhm_defconfig/qcrypto.ko
#make clean

#Make ancora_tmo_oc_uv_hm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_hm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_hm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_sm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_sm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_sm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_vhm_defconfig
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_oc_uv_vhm_defconfig
make
cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/zImage
cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/ancora_tmo_oc_uv_vhm_defconfig/qcrypto.ko
make clean

#Make ancora_tmo_oc_uv_xhm_defconfig
#make clean
#export ARCH=arm
#export SUBARCH=arm
#export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.03/arm-cortex_a8-linux-gnueabi-#linaro_4.8.3-2014.03/bin/arm-gnueabi-
#make ancora_tmo_oc_uv_xhm_defconfig
#make
#cp  /home/doadin/Desktop/kernel/chris/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/zImage
#cp  /home/doadin/Desktop/kernel/chris/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/cifs.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/dhd.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/scsi_wait_scan.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/qce.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/qcedev.ko
#cp  /home/doadin/Desktop/kernel/chris/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/chris/temp/#ancora_tmo_oc_uv_xhm_defconfig/qcrypto.ko
#make clean

#Make Default ADC
#Make ancora_tmo_defconfig
echo "Making Linaro ADC Kernel"
cd /home/doadin/Desktop/kernel/adc/build
make clean
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/doadin/Desktop/kernel/toolchains/linaro_toolchains_2014-2014.06/arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06/bin/arm-cortex_a8-linux-gnueabi-
make ancora_tmo_defconfig
make
cp  /home/doadin/Desktop/kernel/adc/build/arch/arm/boot/zImage /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/zImage
cp  /home/doadin/Desktop/kernel/adc/build/fs/cifs/cifs.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/cifs.ko
cp  /home/doadin/Desktop/kernel/adc/build/drivers/net/wireless/bcmdhd/dhd.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/dhd.ko
cp  /home/doadin/Desktop/kernel/adc/build/drivers/scsi/scsi_wait_scan.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/scsi_wait_scan.ko
cp  /home/doadin/Desktop/kernel/adc/build/drivers/crypto/msm/qce.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/qce.ko
cp  /home/doadin/Desktop/kernel/adc/build/drivers/crypto/msm/qcedev.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/qcedev.ko
cp  /home/doadin/Desktop/kernel/adc/build/drivers/crypto/msm/qcrypto.ko /home/doadin/Desktop/kernel/adc/temp/ancora_tmo_defconfig/qcrypto.ko
make clean


