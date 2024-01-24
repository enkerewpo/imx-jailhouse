cp jailhouse.bin /lib/firmware/jailhouse.bin
insmod jailhouse.ko
# add ./tools to PATH
export PATH=$PATH:./tools
jailhouse enable imx8mp-wheatfox.cell
