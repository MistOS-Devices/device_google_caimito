#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := komodo
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/komodo
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/zumapro/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

#MistOS Extras
# UDFPS support 
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
# Face Unlock
TARGET_FACE_UNLOCK := false
# Blur
TARGET_ENABLE_BLUR := true
# BCR (Call recording)
TARGET_PREBUILT_BCR := true
#TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
# Lawnchair (Pixel launcher by default)
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
# GMS
WITH_GMS := true
# Mist OS Flags
MIST_BUILD_TYPE := OFFICIAL
MISTOS_MAINTAINER := OscarM

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9 Pro XL
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2992
TARGET_SCREEN_WIDTH := 1344

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="komodo-user 15 AP4A.250205.002 12821496 release-keys" \
    BuildFingerprint=google/komodo/komodo:15/AP4A.250205.002/12821496:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
