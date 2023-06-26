#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Gatekeeper
TARGET_USES_DEVICE_SPECIFIC_GATEKEEPER := true

# Keymaster
TARGET_USES_DEVICE_SPECIFIC_KEYMASTER := true

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1440

# Audio
#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/mixer_paths/,$(TARGET_COPY_OUT_ODM)/etc/) \
#    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/platform_info/,$(TARGET_COPY_OUT_ODM)/etc/)

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom_ramdisk \
    init.xiaomi.device.rc \
    init.xiaomi.device.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/sensors/,$(TARGET_COPY_OUT_VENDOR)/etc/sensors/)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
#ifeq ($(TARGET_KERNEL_VERSION),4.19)
#$(call inherit-product, vendor/motorola/moto8937_o_4_19/moto8937_o_4_19-vendor.mk)
#else
$(call inherit-product, vendor/motorola/moto8937_o/moto8937_o-vendor.mk)
#endif
$(call inherit-product-if-exists, vendor/motorola/moto8937_o-2/moto8937_o-vendor.mk)
