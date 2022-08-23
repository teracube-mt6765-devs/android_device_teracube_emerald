#
# Copyright (C) 2022 Teracube Open Devices
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

# Inherit from mt6765-common
include device/teracube/mt6765-common/BoardConfigCommon.mk

DEVICE_PATH := device/teracube/emerald

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Kernel
TARGET_KERNEL_CONFIG := emerald_defconfig

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := emerald,Teracube_2e,yk673v6_lwg62_64

# Partitions
BOARD_TERACUBE_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor
BOARD_TERACUBE_DYNAMIC_PARTITIONS_SIZE := 4292870144
BOARD_SUPER_PARTITION_GROUPS := teracube_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 10070425600

BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832

ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 805306368
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 805306368
endif

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6765
BOARD_USES_RECOVERY_AS_BOOT := true

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/gatekeeper_manifest.xml

# Inherit from proprietary version
include vendor/teracube/emerald/BoardConfigVendor.mk
