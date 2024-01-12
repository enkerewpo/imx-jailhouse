TARGET_DIR=./tmp
mkdir -p $TARGET_DIR

echo "cleanning $TARGET_DIR for jailhouse"
rm -rf $TARGET_DIR/jailhouse.ko
rm -rf $TARGET_DIR/inmates
rm -rf $TARGET_DIR/tools

echo "copying tools to $TARGET_DIR"
cp -r ./tools $TARGET_DIR/tools

echo "copying linux-loader to $TARGET_DIR"
mkdir -p $TARGET_DIR/inmates/tools/arm64
cp ./inmates/tools/arm64/linux-loader.bin $TARGET_DIR/inmates/tools/arm64/linux-loader.bin

echo "copying jailhouse.ko to $TARGET_DIR"
cp ./driver/jailhouse.ko $TARGET_DIR/jailhouse.ko

echo "copying hypervisor/jailhouse.bin to $TARGET_DIR"
cp ./hypervisor/jailhouse.bin $TARGET_DIR/jailhouse.bin

echo "copying cell configurations to $TARGET_DIR"
rm -rf $TARGET_DIR/*.cell
cp ./configs/arm64/imx8mp-wheatfox.cell $TARGET_DIR/imx8mp-wheatfox.cell
cp ./configs/arm64/imx8mp-linux-demo-wheatfox.cell $TARGET_DIR/imx8mp-linux-demo-wheatfox.cell

cp ./init.sh $TARGET_DIR/init.sh
cp ./start-linux.sh $TARGET_DIR/start-linux.sh
cp -r ./kernel $TARGET_DIR/
mv $TARGET_DIR/kernel/imx8mp-evk-inmate-wheatfox.dtb.1 $TARGET_DIR/kernel/imx8mp-evk-inmate-wheatfox.dtb

# then tar gzip the tmp folder into jailhouse-wheatfox.tar.gz
echo "tar gzip the tmp folder into jailhouse-wheatfox.tar.gz"
tar -zcvf jailhouse-wheatfox.tar.gz $TARGET_DIR

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