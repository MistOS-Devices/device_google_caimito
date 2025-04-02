#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
ROM_VENDOR := lineage
ifdef ROM_VENDOR
$(call inherit-product, vendor/$(ROM_VENDOR)/config/common_full_phone.mk)
else
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
endif

# Inherit device configuration
DEVICE_CODENAME := caiman
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/caiman
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9 Pro
ifdef ROM_VENDOR
PRODUCT_NAME := $(ROM_VENDOR)_$(DEVICE_CODENAME)
else
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)
endif

# Boot animation
TARGET_SCREEN_HEIGHT := 2856
TARGET_SCREEN_WIDTH := 1280
TARGET_BOOT_ANIMATION_RES := 1280

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="caiman-user 16 BP4A.260205.002 14624737 release-keys" \
    BuildFingerprint=google/caiman/caiman:16/BP4A.260205.002/14624737:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
