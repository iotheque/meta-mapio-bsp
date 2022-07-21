FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}/:"

SRC_URI:append = " \
    file://defconfig \
"

unset KBUILD_DEFCONFIG
