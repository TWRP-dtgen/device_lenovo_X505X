#
# Copyright 2019 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_PREBUILT_KERNEL := device/lenovo/X505X/prebuilt/zImage

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x0000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00f00000

BOARD_HASH_TYPE := sha1
BOARD_OS_VERSION := 10.0.0
BOARD_OS_PATCH_LEVEL := 2020-07
BOARD_HEADER_VERSION := 1
BOARD_HEADER_SIZE := 1648

BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci
BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x78B0000
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += androidboot.usbconfigfs=true
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += print.devkmsg=on
BOARD_KERNEL_CMDLINE += buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive


# kernel - touchscreen for recovery
BOARD_KERNEL_CMDLINE += androidboot.goodixtp=gtp

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno504
TARGET_BOARD_SUFFIX := _64

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x57E379E00
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x10000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_OEMIMAGE_PARTITION_SIZE := 0x10000000

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

#treble
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext2
BOARD_VENDORIMAGE_PARTITION_SIZE := 0x60000000

#file system
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/firmware_mnt:/firmware


#decryption
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
PLATFORM_SECURITY_PATCH := 2025-12-31

# TWRP specific build flags
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
BOARD_HAS_NO_SELECT_BUTTON := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_NTFS_3G := true

# disable mouse cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# orientation
TW_THEME := portrait_hdpi

#LUN file - error on TWRP for Pie
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.0"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 200

#SHRP_Variables
SHRP_PATH := device/lenovo/X505X
SHRP_MAINTAINER := flashokiller
SHRP_DEVICE_CODE := X505X
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usbotg
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A-Only
SHRP_FLASH := 1
#SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
#SHRP_FONP_2 := /sys/class/leds/led:torch_1/brightness
#SHRP_FONP_3 := /sys/class/leds/led:switch/brightness
#SHRP_FLASH_MAX_BRIGHTNESS := 200
SHRP_OFFICIAL := true
