cp jailhouse.bin /lib/firmware/jailhouse.bin
insmod jailhouse.ko
./tools/jailhouse enable imx8mp-wheatfox.cell
