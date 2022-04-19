# For [A40i](https://www.allwinnertech.com/index.php?c=product&a=index&id=69)
#
# Ref to https://github.com/spff/install-supersu-via-adb/blob/master/suscript.sh
# and https://android.stackexchange.com/questions/224119/how-to-gain-root-on-bluestacks-android-emulator/224120#224120

adb shell "if [ -f /system/xbin/su_original ]; then exit 0; else exit 1; fi"
if test $? -eq 0
then
    echo Already run $0, maybe you need run corresponding revert.sh?
    exit
fi

adb remount

adb shell "mv /system/xbin/su /system/xbin/su_original"
adb push armv7/su system/xbin/su
# adb shell "chmod 4750 /system/xbin/su"
adb shell "chmod 755 /system/xbin/su"
adb shell "chown root:shell /system/xbin/su"
adb shell "chcon u:object_r:system_file:s0 /system/xbin/su"

adb push armv7/su system/xbin/daemonsu
adb shell "chmod 755 /system/xbin/daemonsu"
adb shell "chcon u:object_r:system_file:s0 /system/xbin/daemonsu"

adb shell "mv /system/bin/app_process32 /system/bin/app_process32_original"
adb shell "rm -rf /system/bin/app_process32"
adb shell "ln -s /system/xbin/daemonsu /system/bin/app_process32"
# adb shell "chown root:root /system/bin/app_process32"

adb shell "system/xbin/su --install"

adb install common/Superuser.apk

# Seems need below and click on Android screen to run `SuperSU` APP
# just after run this `.sh` to complete the root.
adb shell "system/xbin/su --daemon"
