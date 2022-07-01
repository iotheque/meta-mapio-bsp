# Only build ext4 and tar.bz2 for 'genimage'
IMAGE_FSTYPES = "ext4 tar.bz2"

# No splash screen
unset SPLASH
DISABLE_SPLASH = "1"

RPI_CONFIG_STRIP = "1"

# Enable USB 2.0 ports as host
ENABLE_DWC2_HOST = "1"

#
# Bootloader
#
UBOOT_BINARY = "u-boot.bin"

#
# Kernel
#
PREFERRED_PROVIDER_virtual/kernel = "linux-stable"
RPI_KERNEL_DEVICETREE_OVERLAYS = ""
KERNEL_IMAGETYPE_DIRECT = "Image"

#
# Firmwares
#
MACHINE_EXTRA_RRECOMMENDS = " \
    kernel-modules \
    linux-firmware-bcm43455 \
    udev-rules-rpi \
"

#
# RPi options
#
# Always turn on UART for debug
ENABLE_UART = "1"
# RPi should boot bootloader instead of linux kernel
RPI_KERNEL = "u-boot.bin"
# Remove comments from config.txt
RPI_CONFIG_STRIP = "1"
RPI_DEVICETREE = "bcm2711-rpi-cm4-io.dtb"

# Where downloaded Raspberry bootfiles are extracted
BOOTFILES_DIR_NAME = "${MACHINE}-bootfiles"

# MAPIO_BOOT_FILES is similar to IMAGE_BOOT_FILES with separator ';' replaced
# by ':'. ';' separator cannot be used in shell functions.
MAPIO_BOOT_FILES = " \
    ${BOOTFILES_DIR_NAME}/config.txt \
    boot.scr \
    Image \
    u-boot.bin \
"