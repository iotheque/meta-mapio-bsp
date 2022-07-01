inherit genimage

DEPENDS:append = " \
    e2fsprogs-native \
"

# Create bmap file
fakeroot do_genimage:append() {
    bmaptool create -o ${B}/${GENIMAGE_IMAGE_NAME}.${GENIMAGE_IMAGE_SUFFIX}.bmap ${B}/${GENIMAGE_IMAGE_NAME}.${GENIMAGE_IMAGE_SUFFIX}
}
do_genimage[depends] += " \
    bmap-tools-native:do_populate_sysroot \
"

# Link to bmap file
do_deploy:append() {
    if [ -f ${DEPLOYDIR}/${GENIMAGE_IMAGE_NAME}.${GENIMAGE_IMAGE_SUFFIX}.bmap ]; then
        ln -sf ${GENIMAGE_IMAGE_NAME}.${GENIMAGE_IMAGE_SUFFIX}.bmap ${DEPLOYDIR}/${GENIMAGE_IMAGE_LINK_NAME}.${GENIMAGE_IMAGE_SUFFIX}.bmap
    fi
}

# Link rootfs image to genimage image name
fakeroot do_genimage:prepend () {
    # Set default label to primary partion
    e2label ${DEPLOY_DIR_IMAGE}/${GENIMAGE_ROOTFS_IMAGE}-${MACHINE}.ext4 A
    # Link to rootfs image to be used in genimage.config
    ln -s ${DEPLOY_DIR_IMAGE}/${GENIMAGE_ROOTFS_IMAGE}-${MACHINE}.ext4 ${DEPLOY_DIR_IMAGE}/${GENIMAGE_IMAGE_NAME}.${GENIMAGE_IMAGE_SUFFIX}.rootfs.ext4
}