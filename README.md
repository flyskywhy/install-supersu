# install-supersu
Install `SuperSu.apk` and related files on Android via adb shell command.

Ref to [install-supersu-via-adb](https://github.com/spff/install-supersu-via-adb/blob/master/suscript.sh) and [How to gain root on BlueStacks Android emulator](https://android.stackexchange.com/questions/224119/how-to-gain-root-on-bluestacks-android-emulator/224120#224120).

PLEASE NOTE: Rooting a device may void the warranty on the device. It may also make the device unstable or if not done properly, may completely brick the device. Some methods may install additional apps/software on your device. I don't take any responsibility for your device. Root at your own risk and only if you understand what you are doing!

## Usage
For sure you can connect device with `adb`.

### [A40i](https://www.allwinnertech.com/index.php?c=product&a=index&id=69)
To root:

    ./armv7-a40i.sh

when you see 'Success', you can `CTRL+c`, and click on Android screen to run `SuperSU` APP.

To revert root:

    ./armv7-a40i-revert.sh
