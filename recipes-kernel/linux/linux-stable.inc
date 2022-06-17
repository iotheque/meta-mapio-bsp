SUMMARY = "Linux mainline kernel"
SECTION = "kernel"
LICENSE = "GPLv2"

# Based on linux-yocto
require recipes-kernel/linux/linux-yocto.inc

# Do not use KERNEL_FEATURES
unset KERNEL_FEATURES

# Source directory
S = "${WORKDIR}/git"

LINUX_VERSION ?= "${PV}"
SRCREV = "c19a885e12f114b799b5d0d877219f0695e0d4de"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;protocol=git;name=machine;nobranch=1; \
"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

KCONFIG_MODE="--alldefconfig"

# Inherit kernel class
inherit kernel