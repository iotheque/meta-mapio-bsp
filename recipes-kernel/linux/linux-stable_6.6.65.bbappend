FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}/:"

SRC_URI:append = " \
    file://defconfig \
    file://bcm2711-rpi-cm4-io.dts \
"

unset KBUILD_DEFCONFIG

do_configure:prepend() {
    cp ${WORKDIR}/bcm2711-rpi-cm4-io.dts ${S}/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
}
