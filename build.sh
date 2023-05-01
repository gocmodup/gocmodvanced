#!/bin/bash
# Revanced build
source tools.sh
dl_gh "revanced" 
# Messenger
get_patches_key "messenger"
dl_mes
patch "messenger" "messenger-revanced"
# Patch Twitch
get_key_patch "twitch"
get_tw_ver
patch "twitch" "twitch-revanced-v$twversion"
# Patch Tiktok 
get_key_patch "tiktok"
get_tt_ver
patch "tiktok" "tiktok-revanced-v$ttversion"