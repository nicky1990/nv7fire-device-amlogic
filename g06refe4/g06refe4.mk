# Copyright (C) 2011 Amlogic Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for M1 reference board. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

#don't copy ringtons files to system
NEED_NO_RINGTONES := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/amlogic/common/mid_amlogic.mk)

# Discard inherited values and use our own instead.
PLATFORM_VERSION_CODENAME := REL
PRODUCT_NAME := g06refe4
PRODUCT_MANUFACTURER := MID
PRODUCT_DEVICE := g06refe4
PRODUCT_MODEL := Novo7Fire
# For all locales, $(call inherit-product, buid/target/product/languages_full.mk)
PRODUCT_LOCALES := zh_CN \
	en_US \
	zh_TW \
	en_GB \
	fr_FR \
	it_IT \
	cs_CZ \
	de_DE \
	da_DK \
	el_GR \
	es_ES \
	ja_JP \
	nl_NL \
	pt_BR \
	ru_RU \
	sv_SE \
	th_TH \
	vi_VN \
	mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

PRODUCT_PACKAGES += \
	camera.amlogic \
	libskia \
	libwebcore \
	compasslib_h5_gcc_armv4t \
	compasslib_h6_gcc_armv4t \
	memsicd \
	sensors.amlogic \
	lights.amlogic \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	HdmiSwitch \
	audio_firmware \
	fw_env \
    40183/nvram.txt \
    40183/fw_bcm40183b2.bin \
    40183/fw_bcm40183b2_apsta.bin \
    40183/fw_bcm40183b2_p2p.bin \
    wl \
    dhd

#BlueTooth
PRODUCT_PACKAGES += Bluetooth

# AML Standard RIL
PRODUCT_PACKAGES += \
	Phone       \
	usb_modeswitch \
	libaml-ril.so \
	init-pppd.sh \
	ip-up \
	chat

# Remote	
PRODUCT_PACKAGES += remotecfg

#flash player
PRODUCT_PACKAGES += \
   oem_install_flash_player.apk \
   libflashplayer.so \
   libstagefright_froyo.so \
   libysshared.so

# Device specific system feature description
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# multitouch
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml
# Touch Screen
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ldwzic_ts.idc:system/usr/idc/ldwzic_ts.idc \
	$(LOCAL_PATH)/Vendor_dead_Product_beef.idc:system/usr/idc/Vendor_dead_Product_beef.idc \
	$(LOCAL_PATH)/Vendor_dead_Product_beef.idc:system/usr/idc/ft5x06.idc

# Battery icons shown from uboot
PRODUCT_COPY_FILES += \
	device/amlogic/common/res/battery/0.rot270.bmp:system/resource/battery_pic/0.bmp \
	device/amlogic/common/res/battery/1.rot270.bmp:system/resource/battery_pic/1.bmp \
	device/amlogic/common/res/battery/2.rot270.bmp:system/resource/battery_pic/2.bmp \
	device/amlogic/common/res/battery/3.rot270.bmp:system/resource/battery_pic/3.bmp \
	device/amlogic/common/res/battery/4.rot270.bmp:system/resource/battery_pic/4.bmp \
	device/amlogic/common/res/battery/power_low.rot270.bmp:system/resource/battery_pic/power_low.bmp
	
PRODUCT_COPY_FILES += device/amlogic/g06refe4/dhd.ko:system/lib/dhd.ko
PRODUCT_COPY_FILES += device/amlogic/g06refe4/hciattach_amp:system/bin/hciattach_amp
PRODUCT_COPY_FILES += device/amlogic/g06refe4/BCM40183B2_26M.hcd:system/etc/bluetooth/BCM40183B2_26M.hcd
PRODUCT_COPY_FILES += device/amlogic/g06refe4/mali.ko:root/boot/mali.ko
PRODUCT_COPY_FILES += device/amlogic/g06refe4/ump.ko:root/boot/ump.ko
PRODUCT_COPY_FILES += device/amlogic/g06refe4/camera.amlogic.so:system/lib/hw/camera.amlogic.so
PRODUCT_COPY_FILES += device/amlogic/g06refe4/libskia.so:system/lib/libskia.so
PRODUCT_COPY_FILES += device/amlogic/g06refe4/libwebcore.so:system/lib/libwebcore.so
PRODUCT_PACKAGES += wpa_supplicant.conf

#Superuser
BOARD_USE_ADD_SUPERUSER := false
ifeq ($(BOARD_USE_ADD_SUPERUSER),true)
PRODUCT_PACKAGES += \
	Superuser \
	su
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.factorytest.rc:root/init.factorytest.rc \
	$(LOCAL_PATH)/../common/res/logo/ainol-e4-1280x800.rle:root/initlogo.rle.bak \
	$(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
	$(LOCAL_PATH)/set_camera_clk.sh:system/bin/set_camera_clk.sh \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/asound.state:system/etc/asound.state \
	$(LOCAL_PATH)/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/android_I2C_Calibrate_V1_0:system/bin/android_I2C_Calibrate_V1_0 \
	$(LOCAL_PATH)/calibration.sh:system/bin/calibration.sh \
	$(LOCAL_PATH)/remote.conf:system/etc/remote.conf \
	$(LOCAL_PATH)/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl  \
	$(LOCAL_PATH)/game_dimension_list.txt:system/etc/game_dimension_list.txt \
	$(LOCAL_PATH)/alarm_blacklist.txt:/system/etc/alarm_blacklist.txt \
	$(LOCAL_PATH)/bt_addr.sh:system/bin/bt_addr.sh
	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wififix.sh:system/bin/wififix.sh

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/u-boot.bin:/u-boot.bin

# App optimization
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/liboptimization.so:system/lib/liboptimization.so \
	$(LOCAL_PATH)/config:system/package_config/config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip
		
# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/g06refe4/overlay
#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_PACKAGES += com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin libwvm libWVStreamControlAPI_L3 libwvdrm_L3

# custom
include $(LOCAL_PATH)/custom.mk
