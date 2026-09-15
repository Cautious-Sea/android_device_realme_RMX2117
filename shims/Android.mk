LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libshim_lights
LOCAL_SRC_FILES := libshim_lights.cpp
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := both
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_PRODUCT)/vendor_overlay/29/lib
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_PRODUCT)/vendor_overlay/29/lib64
LOCAL_POST_INSTALL_CMD = \
    mkdir -p $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/30/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    mkdir -p $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE))) && \
    cp -f $(LOCAL_INSTALLED_MODULE) $(subst /29/,/31/,$(dir $(LOCAL_INSTALLED_MODULE)))
include $(BUILD_SHARED_LIBRARY)
