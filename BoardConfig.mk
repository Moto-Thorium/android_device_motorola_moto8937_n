#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common msm8937-common
include device/motorola/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/moto8937_n
USES_DEVICE_MOTOROLA_MOTO8937_N := true

# Asserts
TARGET_OTA_ASSERT_DEVICE := moto8937_n,montana

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_motorola_moto8937_n
TARGET_RECOVERY_DEVICE_MODULES := init_motorola_moto8937_n

# Kernel
TARGET_KERNEL_CONFIG += \
    vendor/motorola/msm8937/montana.config

TARGET_KERNEL_RECOVERY_CONFIG += \
    vendor/motorola/msm8937/montana.config

# Partitions - dynamic
BOARD_SUPER_PARTITION_BLOCK_DEVICES := oem system
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_OEM_DEVICE_SIZE := 687865856
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2516582400
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_OEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := moto8937_n_dynpart_v1
BOARD_MOTO8937_N_DYNPART_V1_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_MOTO8937_N_DYNPART_V1_PARTITION_LIST := $(ALL_PARTITIONS)

# Partitions - reserved size
$(foreach p, $(call to-upper, $(SSI_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_EXTFS_INODE_COUNT := -1))
$(foreach p, $(call to-upper, $(TREBLE_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_EXTFS_INODE_COUNT := 4096))

$(foreach p, $(call to-upper, $(SSI_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_PARTITION_RESERVED_SIZE := 83886080)) # 80 MB
$(foreach p, $(call to-upper, $(TREBLE_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_PARTITION_RESERVED_SIZE := 41943040)) # 40 MB

ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 419430400 # 400 MB
endif

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2019-02-01

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit from the proprietary version
include vendor/motorola/moto8937_n/BoardConfigVendor.mk
