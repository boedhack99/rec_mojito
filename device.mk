LOCAL_PATH := device/xiaomi/mojito

# define hardware platform
PRODUCT_PLATFORM := sm6150
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true

# A/B support
PRODUCT_PACKAGES += \
    bootctrl.$(PRODUCT_PLATFORM) \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mojito

# qcom standard decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp \

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
#PLATFORM_VERSION := 16.1.0
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

TARGET_RECOVERY_DEVICE_MODULES += libion libandroidicu vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TW_Y_OFFSET := 91
TW_H_OFFSET := -91
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true
PB_DISABLE_DEFAULT_TREBLE_COMP := true
PB_TORCH_PATH := "/sys/class/leds/led:torch_0"

#SHRP_Variables
SHRP_DEVICE_CODE := mojito
SHRP_PATH := device/xiaomi/mojito
SHRP_MAINTAINER := dblenk9
SHRP_DARK := true
SHRP_DEVICE_TYPE := A/B
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg

SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/leds/torch-light0/brightness
SHRP_FONP_2 := /sys/class/leds/torch-light1/brightness
SHRP_FONP_3 := /sys/class/leds/torch-light2/brightness
SHRP_FLASH_MAX_BRIGHTNESS := 4

# SHRP DEFAULT ADDONS
INC_IN_REC_ADDON_1 := true
INC_IN_REC_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true
INC_IN_REC_MAGISK := true

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/mojito/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

ENABLE_VIRTUAL_AB := true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd