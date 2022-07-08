#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=emerald
export DEVICE_COMMON=mt6765-common
export VENDOR=teracube

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
