FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-xen-HACK-disable-warning-delay.patch \
    file://block-up-notification.service \
"
S = "${WORKDIR}"
 
inherit systemd

SYSTEMD_SERVICE_${PN} = "block-up-notification.service"

FILES_${PN} = " \
    ${systemd_system_unitdir}/block-up-notification.service \ 
"

do_install() {
    install -m 0644 ${S}/block-up-notification.service ${D}${systemd_system_unitdir}
}