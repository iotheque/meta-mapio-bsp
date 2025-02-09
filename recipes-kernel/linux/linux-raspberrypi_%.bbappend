FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://bcm2711-rpi-cm4-io.dts \
"

do_configure:prepend() {
    cp ${WORKDIR}/bcm2711-rpi-cm4-io.dts ${S}/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
}
