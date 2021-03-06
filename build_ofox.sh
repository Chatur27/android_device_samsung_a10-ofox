#!/bin/bash

# configure some default settings for the build
Default_Settings() {
    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/recovery"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/vendor"
    export FOX_REPLACE_BUSYBOX_PS="1"
    export FOX_USE_BASH_SHELL="1"
    export FOX_USE_LZMA_COMPRESSION="1"
    export FOX_USE_NANO_EDITOR="1"
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
    export LC_ALL="C"
    export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
    export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
    export OF_NO_SPLASH_CHANGE=1
    export OF_MAINTAINER="Chatur27"
    export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
    export OF_OTA_RES_DECRYPT="1"
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
    export OF_USE_NEW_MAGISKBOOT="1"
    export TARGET_ARCH="arm64"
    export TW_DEFAULT_LANGUAGE="en"
    export FOX_VERSION="R11.1"
    export FOX_R11="1"
    export USE_CCACHE="1"
    export OF_FLASHLIGHT_ENABLE="1"
    export OF_FL_PATH1="/tmp"
    export OF_SCREEN_H="2340"
    export OF_STATUS_H=82
    export FOX_BUILD_TYPE="Beta"
    export FOX_ADVANCED_SECURITY="1"
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_SKIP_FBE_DECRYPTION=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_DELETE_INITD_ADDON=1
    export OF_DEVICE_WITHOUT_PERSIST=1
    export OF_DISABLE_EXTRA_ABOUT_PAGE=1

    # lzma
    [ "$FOX_USE_LZMA_COMPRESSION" = "1" ] && export LZMA_RAMDISK_TARGETS="recovery"

    # A/B devices
    [ "$OF_AB_DEVICE" = "1" ] && export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"

    # magiskboot
    [ "$OF_USE_MAGISKBOOT_FOR_ALL_PATCHES" = "1" ] && export OF_USE_MAGISKBOOT="1"
}

# build the project
do_build() {
  Default_Settings

  # compile it
  . build/envsetup.sh
  
  lunch omni_a10-eng
  
  mka recoveryimage -j`nproc`
}

# --- main --- #
do_build
#
