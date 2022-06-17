
do_deploy:append () {
    install -d ${DEPLOYDIR}/${PN}

    cp -Rf ${S}/* ${DEPLOYDIR}/${PN}
}
