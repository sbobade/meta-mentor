FILESPATH_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://shadow_fix_cross_compile_build_break.patch"

EXTRA_OECONF += "--enable-subordinate-ids"
