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

static const variant_info_t montana_info = {
    .brand = "motorola",
    .device = "montana",
    .marketname = "Moto G (5S)",
    .model = "Moto G (5S)",
    .build_fingerprint = "",

    .dpi = 420,
};

static void determine_variant()
{
    std::string variant;

    android::base::ReadFileToString("/sys/motorola-msm8937-mach/variant", &variant, true);
    if (variant.empty())
        return;
    variant.pop_back();

    if (variant == "montana")
        set_variant_props(montana_info);
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

    property_override("ro.secure", "0");
    property_override("ro.adb.secure", "0");
    property_override("ro.debuggable", "1");
    property_override("persist.sys.usb.config", "adb");
}
