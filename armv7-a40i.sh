# For [A40i](https://www.allwinnertech.com/index.php?c=product&a=index&id=69)
#
# Ref to https://github.com/spff/install-supersu-via-adb/blob/master/suscript.sh
# and https://android.stackexchange.com/questions/224119/how-to-gain-root-on-bluestacks-android-emulator/224120#224120

adb remount

adb shell cp /system/xbin/su /system/xbin/su_origin
adb push armv7/su /system/xbin/su
adb shell chcon u:object_r:system_file:s0 /system/xbin/su

adb push armv7/su /system/xbin/daemonsu
adb shell chcon u:object_r:system_file:s0 /system/xbin/daemonsu

adb shell cp /system/bin/app_process32 /system/bin/app_process32_origin
adb shell rm -rf /system/bin/app_process32
adb shell ln -s /system/xbin/daemonsu /system/bin/app_process32

adb shell /system/xbin/su --install

adb install common/Superuser.apk
