FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:append = " u-boot-default-script"

SRC_URI:append = " \
    file://fw_env.config \
    file://0001-feat-set-magic-word-to-stop-boot.patch \
    file://0001-fix-disable-bus-enum-usb-and-pci-at-boot-to-avoid-cu.patch \
"

do_configure:prepend() {
        sed -i -e 's,CONFIG_ENV_FAT_DEVICE_AND_PART="0:1",CONFIG_ENV_FAT_DEVICE_AND_PART="1:1",g'  ${S}/configs/rpi_arm64_defconfig
}

do_install:append () {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}
