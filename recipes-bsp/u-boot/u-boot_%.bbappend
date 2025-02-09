FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#DEPENDS:append = " u-boot-default-script"

SRC_URI:append = " \
    file://0001-feat-configure-dts-for-MAPIO-board.patch \
"

do_configure:prepend() {
        sed -i -e 's,CONFIG_ENV_FAT_DEVICE_AND_PART="0:1",CONFIG_ENV_FAT_DEVICE_AND_PART="1:1",g'  ${S}/configs/rpi_arm64_defconfig
        echo "CONFIG_AUTOBOOT_KEYED=y" >> ${S}/configs/rpi_arm64_defconfig
        echo 'CONFIG_AUTOBOOT_STOP_STR="mapio"' >> ${S}/configs/rpi_arm64_defconfig
}

