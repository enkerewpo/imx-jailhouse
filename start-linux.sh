./tools/jailhouse cell linux ./imx8mp-linux-demo-wheatfox.cell \
	/boot/Image \
	-i ./kernel/rootfs.cpio.gz \
	-d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
	-c "clk_ignore_unused console=ttymxc3,0x30a60000,115200 earlycon=ec_imx6q,0x30890000,115200 root=/dev/ram rdinit=/linuxrc rootwait rw"
