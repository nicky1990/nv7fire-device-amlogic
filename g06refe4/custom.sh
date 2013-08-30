#! /bin/bash

funpatch()
{     
    if [ -n "$1"  -a -n "$2" ];then
		dirpath=$(dirname $1)
		cd $dirpath
		filename=$(basename $1)
		git checkout $filename
		cd -
		patch $1 < $2
		if [ -f $1.orig ];then
			echo -e "\033[31mpatch failed!! someone modified the file or something,please check the patch!!!!\033[0m"
			exit 1
		fi
		if [ -f $1.rej ];then
			echo -e "\033[31mpatch has been committed by owner or something ,so the patch is outdate!!\033[0m"
			exit 2
		fi
	else
		echo -e "\033[31merror in $0: please fill function argument..............\033[0m"
		exit 3
	fi

}


#Remove Baseband version in Setting
funpatch   packages/apps/Settings/src/com/android/settings/DeviceInfoSettings.java  device/amlogic/g06refe4/custom/DeviceInfoSettings.patch
	
#modify default Network address
#funpatch  packages/apps/Browser/res/values/strings.xml device/amlogic/g06refe4/custom/strings.patch
	
#recovery add copy custom dir form sdcard when upgrade
funpatch bootable/recovery/recovery.c device/amlogic/g06refe4/custom/recovery.patch
funpatch bootable/recovery/roots.c  device/amlogic/g06refe4/custom/roots.patch

#Lauch change to 6*4
funpatch packages/apps/Launcher2/src/com/android/launcher2/IconCache.java  device/amlogic/g06refe4/custom/IconCache.patch	

#Set allow mock location select
funpatch build/core/main.mk   device/amlogic/g06refe4/custom/main.patch
	
#set Browser  to android mode 
funpatch  packages/apps/Browser/res/xml/advanced_preferences.xml  device/amlogic/g06refe4/custom/advanced_preferences.patch
funpatch  packages/apps/Browser/src/com/android/browser/BrowserSettings.java  device/amlogic/g06refe4/custom/BrowserSettings.patch

#logo
#funpatch system/core/init/init.c  device/amlogic/g06refe4/custom/init.c.patch
#funpatch frameworks/base/cmds/bootanimation/BootAnimation.cpp  device/amlogic/g06refe4/custom/BootAnimation.cpp.patch
#funpatch frameworks/base/cmds/bootanimation/BootAnimation.h  device/amlogic/g06refe4/custom/BootAnimation.h.patch

#horizontal screen when animate
#funpatch frameworks/base/policy/src/com/android/internal/policy/impl/PhoneWindowManager.java  device/amlogic/g06refe4/custom/PhoneWindowManager.patch


#add wifi menu
funpatch frameworks/base/services/java/com/android/server/WifiService.java  device/amlogic/g06refe4/custom/WifiService.patch

#change for liboptimization.so,change core for airol test Apk
funpatch common/arch/arm/mach-meson6/time.c  device/amlogic/g06refe4/custom/common-time.patch

#change for camera mirror
if [ $1 = "e4ainol" ];then
funpatch common/drivers/amlogic/camera/hi253.c  device/amlogic/g06refe4/custom/hi253.patch
fi

#modify sound to ceramic sound
#funpatch device/amlogic/g06refe4/asound.state device/amlogic/g06refe4/custom/asound.state.patch
#funpatch common/sound/soc/aml/aml_m6_wm8960.c device/amlogic/g06refe4/custom/aml_m6_wm8960.c.patch
#funpatch common/include/sound/wm8960.h device/amlogic/g06refe4/custom/wm8960.h.patch
#patch for axp20 
 funpatch common/drivers/amlogic/power/axp_power/axp-mfd.c device/amlogic/g06refe4/custom/AXP20-patch/axp-mfd.c.patch
 funpatch common/drivers/amlogic/power/axp_power/axp-mfd.h device/amlogic/g06refe4/custom/AXP20-patch/axp-mfd.h.patch
 funpatch common/drivers/amlogic/power/axp_power/axp20-sply.c device/amlogic/g06refe4/custom/AXP20-patch/axp20-sply.c.patch

#fix upgrade issue
#funpatch common/drivers/amlogic/nand/aml_nand.c device/amlogic/g06refe4/custom/aml_nand.patch

#pm.c for backlight can't open in some time
#funpatch common/arch/arm/mach-meson6/pm.c device/amlogic/g06refe4/custom/pm.c.patch


# adb usb gadget
# funpatch common/drivers/usb/gadget/android.c device/amlogic/g06refe4/custom/adb-usb/usbandroid.patch
# funpatch common/drivers/usb/gadget/composite.c device/amlogic/g06refe4/custom/adb-usb/compositec.patch
# funpatch common/drivers/usb/gadget/f_adb.c device/amlogic/g06refe4/custom/adb-usb/f_adb.patch
# funpatch common/drivers/usb/gadget/f_mass_storage.c device/amlogic/g06refe4/custom/adb-usb/massstorage.patch
# funpatch common/drivers/usb/gadget/fsg.h device/amlogic/g06refe4/custom/adb-usb/fsg.patch
# funpatch common/drivers/usb/gadget/storage_common.c device/amlogic/g06refe4/custom/adb-usb/storagecommon.patch
# funpatch common/include/linux/usb/composite.h device/amlogic/g06refe4/custom/adb-usb/compositeh.patch

#RJ45 patch
#funpatch common/drivers/net/usb/usbnet.c device/amlogic/g06refe4/custom/Rj45-qf9700/usbnet.patch

#HDMI Auto-Switch patch 
#funpatch packages/amlogic/HdmiSwitch/AndroidManifest.xml device/amlogic/g06refe4/custom/hdmi-switch/hdmlAndroidmanifest.patch
#funpatch packages/amlogic/HdmiSwitch/src/com/amlogic/HdmiSwitch/HdmiBroadcastReceiver.java device/amlogic/g06refe4/custom/hdmi-switch/HdmiBroadcastService.patch
#funpatch packages/amlogic/HdmiSwitch/src/com/amlogic/HdmiSwitch/HdmiSwitch.java device/amlogic/g06refe4/custom/hdmi-switch/hdmiswitch.patch
#cp device/amlogic/g06refe4/custom/hdmi-switch/HdmiDelayedService.java packages/amlogic/HdmiSwitch/src/com/amlogic/HdmiSwitch/HdmiDelayedService.java

#Gallery2 patch Stop video play when hdmi state changed
funpatch packages/apps/Gallery2/src/com/android/gallery3d/app/MovieActivity.java device/amlogic/g06refe4/custom/hdmi-switch/MovieActivity.patch


#modify dim brightness from 20 to 0
funpatch frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/policy/BrightnessController.java device/amlogic/g06refe4/custom/BrightnessController.java.patch
funpatch frameworks/base/core/java/android/os/Power.java device/amlogic/g06refe4/custom/Power.java.patch
funpatch packages/apps/Settings/src/com/android/settings/widget/SettingsAppWidgetProvider.java  device/amlogic/g06refe4/custom/SettingsAppWidgetProvider.java.patch

# ov5640 auto focus 
#funpatch common/include/media/amlogic/aml_camera.h  device/amlogic/g06refe4/custom/aml_camera.h.patch

#auto hide status bar for some apks
funpatch frameworks/base/services/java/com/android/server/am/ActivityStack.java  device/amlogic/g06refe4/custom/statusbar/ActivityStack.patch
funpatch packages/apps/Settings/src/com/android/settings/DisplaySettings.java  device/amlogic/g06refe4/custom/statusbar/setting/Displaysetjava.patch
funpatch packages/apps/Settings/res/values/strings.xml  device/amlogic/g06refe4/custom/statusbar/setting/packagesetstring.patch
funpatch packages/apps/Settings/res/values-zh-rCN/strings.xml  device/amlogic/g06refe4/custom/statusbar/setting/packagesetstringcn.patch
funpatch packages/apps/Settings/res/values-zh-rTW/strings.xml  device/amlogic/g06refe4/custom/statusbar/setting/packagesetstringtw.patch
funpatch packages/apps/Settings/res/xml/display_settings.xml  device/amlogic/g06refe4/custom/statusbar/setting/displaysetxml.patch
funpatch frameworks/base/policy/src/com/android/internal/policy/impl/PhoneWindowManager.java  device/amlogic/g06refe4/custom/statusbar/setting/PhoneWindowManager.patch
funpatch frameworks/base/core/java/android/provider/Settings.java  device/amlogic/g06refe4/custom/statusbar/setting/settingsjava.patch
funpatch frameworks/base/packages/SystemUI/src/com/android/systemui/SystemUIService.java  device/amlogic/g06refe4/custom/statusbar/setting/systemuistatusbar.patch
#ov5640 driver
funpatch common/include/media/amlogic/aml_camera.h device/amlogic/g06refe4/custom/aml_camera.h.patch
funpatch common/include/media/amlogic/flashlight.h device/amlogic/g06refe4/custom/flashlight.h.patch
funpatch common/drivers/amlogic/camera/ov5640.c device/amlogic/g06refe4/custom/ov5640.c.patch

#modified for 0v5640 continus auto focus.
#funpatch hardware/amlogic/camera/V4LCameraAdapter/V4LCameraAdapter.cpp device/amlogic/g06refe4/custom/V4LCameraAdapter.cpp.patch
#funpatch hardware/amlogic/camera/inc/V4LCameraAdapter/V4LCameraAdapter.h device/amlogic/g06refe4/custom/V4LCameraAdapter.h.patch

#close CTS_CPU_CLK print
funpatch common/arch/arm/mach-meson6/clock.c device/amlogic/g06refe4/custom/clock.c.patch

#lcd power on / off bug
funpatch common/kernel/sys.c device/amlogic/g06refe4/custom/sys.c.patch

#set default input method for baidu
funpatch frameworks/base/services/java/com/android/server/InputMethodManagerService.java device/amlogic/g06refe4/custom/InputMethodManagerService.java.patch
funpatch frameworks/base/core/res/res/values/config.xml device/amlogic/g06refe4/custom/frameworks-config.xml.patch
#wifi ko update
#funpatch common/drivers/amlogic/wifi/broadcm_40181/dhd_sdio.c device/amlogic/g06refe4/custom/dhd_sdio.c.patch
#funpatch common/drivers/amlogic/wifi/broadcm_40181/include/epivers.h device/amlogic/g06refe4/custom/epivers.h.patch

#open network mid can not suspend
funpatch frameworks/base/services/sensorservice/SensorDevice.cpp device/amlogic/g06refe4/custom/SensorDevice.cpp.patch

#rt5631 lineout 
funpatch common/sound/soc/aml/aml_m6_rt5631.c device/amlogic/g06refe4/custom/aml_m6_rt5631.c.patch
funpatch common/sound/soc/codecs/rt5631.c device/amlogic/g06refe4/custom/rt5631.c.patch

#format media when recovery 
#funpatch device/amlogic/common/recovery/fdisk.media.sh device/amlogic/g06refe4/custom/fdisk.media.sh.patch

#recovery init.rc for recovery copy user file to media partition
funpatch bootable/recovery/etc/init.rc device/amlogic/g06refe4/custom/recovery_init.rc.patch

#speed up G-sensor 
funpatch frameworks/base/core/java/android/hardware/SensorManager.java device/amlogic/g06refe4/custom/SensorManager.java.patch

if [ $1 = "xxxx" ];then
cd common
echo "patch ov5640 auto focus"
patch -p1 < ../device/amlogic/g06refe4/custom/ov5640-focus.patch
cd ../
fi
echo "finish copy patch files. "



