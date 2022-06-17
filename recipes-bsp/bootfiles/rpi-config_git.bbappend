# Use mainline devicetree for VC4
unset VC4GRAPHICS
unset VC4DTBO

do_deploy:append () {
    # Kernel image to launch
    if [ -n "${RPI_KERNEL}" ]; then
        echo "# Change default booted image" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
        echo "arm_64bit=1" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
        echo "kernel=${RPI_KERNEL}" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    fi

    # Device tree
    if [ -n "${RPI_DEVICETREE}" ]; then
        echo "# Change default device tree" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
        echo "device_tree=${RPI_DEVICETREE}" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    fi

    # Use mini-uart
    if [ "${RPI_UART_2NDSTAGE}" = "1" ]; then
        echo "# Use mini-uart" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
        echo "uart_2ndstage=1" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    fi

    # Clean comments and empty lines
    if [ "${RPI_CONFIG_STRIP}" = "1" ]; then
        sed -i '/^#/d' ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
        sed -i '/^$/d' ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    fi
}
