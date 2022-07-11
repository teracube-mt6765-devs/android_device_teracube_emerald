#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=emerald
export DEVICE_COMMON=mt6765-common
export VENDOR=teracube

function blob_fixup {
    case "${1}" in
	vendor/bin/hw/android.hardware.keymaster@4.0-service.beanpod)
            "${PATCHELF}" --add-needed "libshim_beanpod.so" "${2}"
            ;;
    esac
}

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
