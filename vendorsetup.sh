#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

add_lunch_combo twrp_a02-user
add_lunch_combo twrp_a02-userdebug
add_lunch_combo twrp_a02-eng

FDEVICE="SM-A022F"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TW_DEFAULT_LANGUAGE="en"
	export TARGET_DEVICE_ALT="SM-A022F"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_USE_LZMA_COMPRESSION=1
	export FOX_DRASTIC_SIZE_REDUCTION=
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_DELETE_AROMAFM=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_MAINTAINER_PATCH_VERSION="02"
	export OF_PATCH_AVB20=1
	export OF_MAINTAINER="a02-trial"
	export FOX_ADVANCED_SECURITY=1
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	export FOX_VANILLA_BUILD=1

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi

fi
#
