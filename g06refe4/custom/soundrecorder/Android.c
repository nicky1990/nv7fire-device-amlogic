ifneq ($(TARGET_PRODUCT),g06refe4)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_PACKAGE_NAME := SoundRecorder

include $(BUILD_PACKAGE)

endif
