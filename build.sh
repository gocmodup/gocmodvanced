#!/bin/bash
source ./src/patch.sh
get_patch "revanced"
# Patch Messenger
get_key_patch "messenger"
patch "com.facebook.orca" "messenger-revanced"
# Patch Twitch
get_key_patch "twitch"
get_tw_ver
patch "tv.twitch.android.app@$twversion" "twitch-revanced-v$twversion"
# Patch Tiktok 
