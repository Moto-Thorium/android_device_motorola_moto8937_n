#!/vendor/bin/sh

set_acdb_path_props() {
	i=0
	for f in `ls /vendor/etc/acdbdata/${1}/*.*`; do
		setprop "persist.vendor.audio.calfile${i}" "${f}"
		let i+=1
	done
}

case "$(cat /sys/motorola-msm8937-mach/variant)" in
	*)
		set_acdb_path_props "$(cat /sys/motorola-msm8937-mach/variant)"
		;;
esac

exit 0
