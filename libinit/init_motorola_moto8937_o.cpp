/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_utils.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#include <android-base/file.h>
#include <android-base/properties.h>

static const variant_info_t ahannah_info = {
    .brand = "motorola",
    .device = "ahannah",
    .marketname = "moto e⁵ plus",
    .model = "XT1924",
    .build_fingerprint = "",

    .dpi = 280,
};

static void determine_variant()
{
    std::string variant;

    android::base::ReadFileToString("/sys/motorola-msm8937-mach/variant", &variant, true);
    if (variant == "ahannah")
        set_variant_props(ahannah_info);
}

static void set_model()
{
    std::string sku = android::base::GetProperty("ro.boot.hardware.sku", "");
    if (!sku.empty())
        set_ro_build_prop("model", sku, true);
}

void vendor_load_properties() {
    determine_variant();
    set_dalvik_heap();
    set_model();
}
