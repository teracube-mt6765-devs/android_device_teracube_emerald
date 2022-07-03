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

# Kernel
TARGET_KERNEL_CONFIG := emerald_defconifg

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := emerald,Teracube_2e,yk673v6_lwg62_64

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from proprietary version
include vendor/teracube/emerald/BoardConfigVendor.mk
