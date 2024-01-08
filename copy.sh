TARGET_DIR=/media/wheatfox/wheatfox

echo "cleanning $TARGET_DIR for jailhouse"
rm -rf $TARGET_DIR/jailhouse.ko
rm -rf $TARGET_DIR/inmates
rm -rf $TARGET_DIR/tools

echo "copying tools to $TARGET_DIR"
cp -r ./tools $TARGET_DIR/tools

echo "copying inmates to $TARGET_DIR"
cp -r ./inmates $TARGET_DIR/inmates

echo "copying jailhouse.ko to $TARGET_DIR"
cp ./driver/jailhouse.ko $TARGET_DIR/jailhouse.ko

echo "copying hypervisor/jailhouse.bin to $TARGET_DIR"
cp ./hypervisor/jailhouse.bin $TARGET_DIR/jailhouse.bin

