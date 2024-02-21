. /opt/fsl-imx-xwayland/5.4-zeus/environment-setup-aarch64-poky-linux
# if make error then exit
make || exit
aarch64-poky-linux-objdump inmates/demos/arm64/uart-wheatfox-linked.o -d > inmates/demos/arm64/uart-wheatfox.asm
./copy.sh