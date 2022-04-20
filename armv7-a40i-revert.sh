result=`adb shell "if [ -f /system/xbin/su_original ]; then echo 0; else echo 1; fi"`
if test $result -eq 1
then
    echo Nothing need to be reverted!
    exit
fi

adb remount

adb shell "mv /system/xbin/su_original /system/xbin/su"
adb shell "chcon u:object_r:system_file:s0 /system/xbin/su"

adb shell "rm -rf /system/bin/app_process32"
adb shell "mv /system/bin/app_process32_original /system/bin/app_process32"
adb shell "chown root:root /system/bin/app_process32"
