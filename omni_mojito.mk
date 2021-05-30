#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Release name
PRODUCT_RELEASE_NAME := mojito

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:Image.gz-dtb \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mojito
PRODUCT_NAME := omni_mojito
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 10
PRODUCT_MANUFACTURER := Xiaomi

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
