FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://rngd.service"

inherit systemd

SYSTEMD_SERVICE_${PN} = "rngd.service"

do_install_append() {
	# Install systemd service file when 'systemd' is in DISTRO_FEATURES.
	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
			install -d ${D}${systemd_unitdir}/system
			install -m 0644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
	fi
}
