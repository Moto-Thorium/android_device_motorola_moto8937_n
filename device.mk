#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Audio
#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/mixer_paths/,$(TARGET_COPY_OUT_ODM)/etc/) \
#    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio/platform_info/,$(TARGET_COPY_OUT_ODM)/etc/)

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
#$(call inherit-product, vendor/motorola/moto8937_n_4_19/moto8937_n_4_19-vendor.mk)
#else
$(call inherit-product, vendor/motorola/moto8937_n/moto8937_n-vendor.mk)
#endif
$(call inherit-product-if-exists, vendor/motorola/moto8937_n-2/moto8937_n-vendor.mk)
