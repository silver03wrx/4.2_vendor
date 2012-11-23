# Copyright (C) 2012 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Camera
PRODUCT_PACKAGES := \
    Camera \
    Gallery \
    GNexusParts

#if we do this after the full_base_telephony is included some of these don't get picked up..
PRODUCT_COPY_FILES += \
    device/samsung/toroplus/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/samsung/toroplus/plus-apns-conf.xml:system/etc/apns-conf.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from toro device
$(call inherit-product, device/samsung/toroplus/device.mk)

# T-Mobile theme engine

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_toroplus
PRODUCT_DEVICE := toroplus
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy Nexus
BUILD_ID := IMM76D
BUILD_DISPLAY := IMM76D.L700FC12
BUILD_VERSION_INCREMENTAL := L700FC12
PRODUCT_MANUFACTURER := samsung
BUILD_DESCRIPTION := mysidspr-user 4.0.4 IMM76I 330937 release-keys
BUILD_FINGERPRINT := samsung/mysidspr/toroplus:4.0.4/IMM76I/330937:user/release-keys



