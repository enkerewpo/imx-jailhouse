TARGET_DIR=./tmp
mkdir -p $TARGET_DIR

# clean the tmp folder
echo "cleanning $TARGET_DIR for jailhouse"
rm -rf $TARGET_DIR/jailhouse.ko
rm -rf $TARGET_DIR/inmates
rm -rf $TARGET_DIR/tools

# copy the tools folder to the tmp folder
echo "copying tools to $TARGET_DIR"
cp -r ./tools $TARGET_DIR/tools

# copy the linux-loader.bin
echo "copying linux-loader to $TARGET_DIR"
mkdir -p $TARGET_DIR/inmates/tools/arm64
cp ./inmates/tools/arm64/linux-loader.bin $TARGET_DIR/inmates/tools/arm64/linux-loader.bin

# copy the kernel modules
echo "copying jailhouse.ko to $TARGET_DIR"
cp ./driver/jailhouse.ko $TARGET_DIR/jailhouse.ko

# copy the bin files
echo "copying bin files to $TARGET_DIR"
cp ./hypervisor/jailhouse.bin $TARGET_DIR/jailhouse.bin
cp ./inmates/demos/arm64/uart-wheatfox.bin $TARGET_DIR/uart-wheatfox.bin
cp ./inmates/demos/arm64/gic-demo.bin $TARGET_DIR/gic-demo.bin

# copy the cell configurations
echo "copying cell configurations to $TARGET_DIR"
rm -rf $TARGET_DIR/*.cell
cp ./configs/arm64/imx8mp-wheatfox.cell $TARGET_DIR/imx8mp-wheatfox.cell
cp ./configs/arm64/imx8mp-gic-demo.cell $TARGET_DIR/imx8mp-gic-demo.cell
cp ./configs/arm64/imx8mp-linux-demo-wheatfox.cell $TARGET_DIR/imx8mp-linux-demo-wheatfox.cell
cp ./configs/arm64/imx8mp-uart-wheatfox.cell $TARGET_DIR/imx8mp-uart-wheatfox.cell

# copy the init.sh and start-linux.sh
cp ./init.sh $TARGET_DIR/init.sh
cp ./start-linux.sh $TARGET_DIR/start-linux.sh
cp ./start-uart.sh $TARGET_DIR/start-uart.sh
cp ./start-gic.sh $TARGET_DIR/start-gic.sh

# copy /opt/nxp//opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/arch/arm64/boot/dts/freescale/imx8mp-evk-inmate-wheatfox.dtb to kernel/imx8mp-evk-inmate-wheatfox.dtb.1
echo "updateing kernel/imx8mp-evk-inmate-wheatfox.dtb.1"
cp /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/arch/arm64/boot/dts/freescale/imx8mp-evk-inmate-wheatfox.dts ./kernel/imx8mp-evk-inmate-wheatfox.dts
cp /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/arch/arm64/boot/dts/freescale/imx8mp-evk-inmate-wheatfox.dtb ./kernel/imx8mp-evk-inmate-wheatfox.dtb.1

echo "backup OK8MP-C-board.dts and dtb"
cp /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/arch/arm64/boot/dts/freescale/OK8MP-C-board.dts ./kernel/OK8MP-C-board.dts
cp /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/arch/arm64/boot/dts/freescale/OK8MP-C-board.dtb ./kernel/OK8MP-C-board.dtb.1
# remember you need to build this dts only in SDK folder with 'build.sh kernel' cmd and add the dts to Makefile

# copy the kernel folder
cp -r ./kernel $TARGET_DIR/
mv $TARGET_DIR/kernel/imx8mp-evk-inmate-wheatfox.dtb.1 $TARGET_DIR/kernel/imx8mp-evk-inmate-wheatfox.dtb

# then tar gzip the tmp folder into jailhouse-wheatfox.tar.gz
echo "tar gzip the tmp folder into jailhouse-wheatfox.tar.gz"
tar -zcf jailhouse-wheatfox.tar.gz $TARGET_DIR

# copy the jailhouse-wheatfox.tar.gz to the /var/www/html/
echo "copy the jailhouse-wheatfox.tar.gz to the /var/www/html/"
sudo cp jailhouse-wheatfox.tar.gz /var/www/html/

# print my ip
echo "this machine's ip address:"
ip addr show wlp0s20f3 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1

echo "finished, have fun!"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠙⠻⢶⣄⡀⠀⠀⠀⢀⣤⠶⠛⠛⡇⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⣙⣿⣦⣤⣴⣿⣁⠀⠀⣸⠇⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣡⣾⣿⣿⣿⣿⣿⣿⣿⣷⣌⠋⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣷⣄⡈⢻⣿⡟⢁⣠⣾⣿⣦⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠘⣿⠃⣿⣿⣿⣿⡏⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠈⠛⣰⠿⣆⠛⠁⠀⡀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣦⠀⠘⠛⠋⠀⣴⣿⠁⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⡇⠀⠀⠀⢸⣿⣏⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⠿⠿⠀⠀⠀⠾⢿⣿⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣋⣁⣤⣤⡶⠶⠶⣤⣄⠈⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⢰⣿⣿⣮⣉⣉⣉⣤⣴⣶⣿⣿⣋⡥⠄⠀⠀⠀⠀⠉⢻⣄⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣋⣁⣤⣀⣀⣤⣤⣤⣤⣄⣿⡄⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠁⠀⠀⠀⠀⠈⠛⠃⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"