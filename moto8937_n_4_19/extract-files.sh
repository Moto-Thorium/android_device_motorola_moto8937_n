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

export DEVICE=moto8937_n_4_19
export DEVICE_PARENT=moto8937_n
export DEVICE_COMMON=msm8937-common
export VENDOR=motorola

MY_DIR="$(cd "$(dirname "${0}")"; pwd -P)"

"${MY_DIR}/../../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "--kernel-4.19" "$@"
