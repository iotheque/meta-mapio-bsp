SECTION = "kernel"
LICENSE = "GPLv2"

# Based on linux-yocto
# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/linux-yocto.inc

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

# Do not use KERNEL_FEATURES
unset KERNEL_FEATURES

SRC_URI = "\
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;protocol=git;name=machine;nobranch=1; \
"

SRCREV = "943e0aeece93a9c2329215d02621e634adf6d790"

# Source directory
# nooelint: oelint.vars.unpackdir
S = "${WORKDIR}/git"

LINUX_VERSION ?= "${PV}"

KCONFIG_MODE = "--alldefconfig"

# Inherit kernel class
inherit kernel
