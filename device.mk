#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-xdroid

# RRO configuration
PRODUCT_ENFORCE_RRO_TARGETS := *

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 30 31

# Runtime Overlays
PRODUCT_PACKAGES += \
   CarrierConfigOverlayAtom \
   FrameworksResOverlayAtom \
   SettingsOverlayAtom \
   SystemUIOverlayAtom \
   TelephonyOverlayAtom

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false 

# Audio 
PRODUCT_PACKAGES += \
    audio.a2dp.default
 
# Camera
PRODUCT_PACKAGES += \
    CameraGo

PRODUCT_COPY_FILES += \
    hardware/interfaces/camera/provider/2.4/default/android.hardware.camera.provider@2.4-service_64.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.camera.provider@2.4-service_64.rc

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi_mt6873

# HIDL 
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# Init
PRODUCT_PACKAGES += \
	fstab.mt6873

# RcsService
PRODUCT_PACKAGES += \
    RcsService

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml
