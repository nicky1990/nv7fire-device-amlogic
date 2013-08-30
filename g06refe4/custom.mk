ifeq ($(TARGET_PRODUCT),g06refe4)
#custom1 should be call before make rootfs,We use a shell script to do this automatically(visual.zhang)
.PHONY: custom1
custom1:
	echo "begin copy init custom1024 files...."

#change default  background image
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-large-nodpi/
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-xlarge-nodpi/


# install soundrecorder apk
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/soundrecorder/Android.c   $(shell pwd)/packages/apps/SoundRecorder/Android.mk

# ac3 dts license
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/license/audiodsp_codec_ac3.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware-m6/
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/license/audiodsp_codec_dca.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware-m6/
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/license/audiodsp_codec_ddp_dcv.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware-m6/
#for sensor.amlogic,used new hal for g-sensor and lightsensor
	#rm -fr $(shell pwd)/hardware/amlogic/sensors/bosch_bma250/
	#rm -fr $(shell pwd)/hardware/amlogic/sensors/aml_Gsensor
	#cp -r  $(shell pwd)/device/amlogic/g06refe4/custom/aml_Gsensor   $(shell pwd)/hardware/amlogic/sensors/aml_Gsensor/
	#mv  $(shell pwd)/hardware/amlogic/sensors/aml_Gsensor/Android.mk.bak $(shell pwd)/hardware/amlogic/sensors/aml_Gsensor/Android.mk

	#echo "finish copy init custom1024 files. please build the project."

#custom2 should be call after make rootfs and before make otapackage,We use a shell script to do this automatically(visual.zhang)
.PHONY: custom2
custom2:

#Customized  factory test function apk
#	cp -r $(shell pwd)/device/amlogic/g06refe4/custom/app  $(shell pwd)/out/target/product/g06refe4/system/
#	cp  $(shell pwd)/device/amlogic/g06refe4/custom/libfactoryjni.so   $(shell pwd)/out/target/product/g06refe4/system/lib/

#chmod root permission
	cp  $(shell pwd)/device/amlogic/g06refe4/custom/su   $(shell pwd)/out/target/product/g06refe4/system/xbin/
#change for liboptimization.so,change core for airol test Apk
	cp  $(shell pwd)/device/amlogic/g06refe4/liboptimization.so   $(shell pwd)/out/target/product/g06refe4/system/lib/
	cp  $(shell pwd)/device/amlogic/g06refe4/camera.amlogic.so   $(shell pwd)/out/target/product/g06refe4/system/lib/hw/

#e4ainol/e4jinli should be call before make rootfs,for tow platforms,We use a shell script to do this automatically(visual.zhang)
.PHONY: e4ainol
e4ainol:
# custom patch file
	./device/amlogic/g06refe4/custom.sh e4ainol
	# echo "begin copy the camera files for ainol ..."

	# cp  $(shell pwd)/device/amlogic/g06refe4/custom/camera/Kconfig   $(shell pwd)/common/drivers/amlogic/camera/
	# cp  $(shell pwd)/device/amlogic/g06refe4/custom/camera/Makefile   $(shell pwd)/common/drivers/amlogic/camera/
	# cp  $(shell pwd)/device/amlogic/g06refe4/custom/camera/ov5640.c   $(shell pwd)/common/drivers/amlogic/camera/
	# cp  $(shell pwd)/device/amlogic/g06refe4/custom/camera/ov5640_firmware.h   $(shell pwd)/common/drivers/amlogic/camera/

	# echo "finish copy the camera files for ainol. please build the project"

.PHONY: e4jinli
e4jinli:
# custom patch file
	./device/amlogic/g06refe4/custom.sh e4jinli
endif
