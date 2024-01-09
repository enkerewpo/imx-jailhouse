./tools/jailhouse cell linux \
	./imx8mp-linux-demo-wheatfox.cell \
	/boot/Image \
	-i ./kernel/ramdisk.img \
	-d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
	-c "clk_ignore_unused console=ttymxc1,0x30890000,115200 earlycon=ec_imx6q,0x30890000,115200"
