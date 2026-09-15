LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.light@2.0-service.RMX2117
LOCAL_MODULE_STEM := android.hardware.lights-service.mediatek
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/29/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS  := optional
LOCAL_REQUIRED_MODULES := lights-mtk-default.xml
LOCAL_SRC_FILES := service.cpp Light.cpp
LOCAL_SHARED_LIBRARIES := liblog libhidlbase libvndksupport
LOCAL_STATIC_LIBRARIES := libbase libutils libcutils android.hardware.light@2.0
LOCAL_LDFLAGS += -Wl,--exclude-libs,ALL
LOCAL_POST_INSTALL_CMD = \
    mkdir -p $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    mkdir -p $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE)))
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := lights-mtk-default.xml
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/29/etc/vintf/manifest
LOCAL_POST_INSTALL_CMD = \
    mkdir -p $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    mkdir -p $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE)))
include $(BUILD_PREBUILT)
