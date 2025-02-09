# Image FS
IMAGE_FSTYPES = "ext4 wic wic.bz2"

# No splash screen
unset SPLASH
DISABLE_SPLASH = "1"


# Enable USB 2.0 ports as host
ENABLE_DWC2_HOST = "1"

#
# Bootloader
#
UBOOT_BINARY = "u-boot.bin"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
PREFERRED_PROVIDER_u-boot-default-script = "u-boot-scr"
#
# Kernel
#
RPI_KERNEL_DEVICETREE_OVERLAYS = ""
KERNEL_IMAGETYPE_DIRECT = "Image"

#
# Firmwares
#
MACHINE_FEATURES += "pci"
MACHINE_EXTRA_RRECOMMENDS += " \
    kernel-modules \
    linux-firmware-bcm43455 \
    linux-firmware-rpidistro-bcm43455 \
    bluez-firmware-rpidistro-bcm4345c0-hcd \
    linux-firmware-rpidistro-bcm43456 \
    bluez-firmware-rpidistro-bcm4345c5-hcd \
    udev-rules-rpi \
"

#
# RPi options
#
# Always turn on UART for debug
ENABLE_UART = "1"
# Default console (rpiboot, uboot, kernel) is on tty1
SERIAL_CONSOLES = "tty1,115200"
# RPi should boot bootloader instead of linux kernel
RPI_KERNEL = "u-boot.bin"
# Remove comments from config.txt
RPI_CONFIG_STRIP = "1"
RPI_DEVICETREE = "bcm2711-rpi-cm4-io.dtb"

# Where downloaded Raspberry bootfiles are extracted
BOOTFILES_DIR_NAME = "${MACHINE}-bootfiles"
