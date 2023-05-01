#!/bin/bash
source tools.sh
get_patch "revanced"
# Patch Messenger
#get_key_patch "messenger"
#patch "com.facebook.orca" "messenger-revanced"
# Patch Twitch
#get_key_patch "twitch"
#get_tw_ver
#patch "tv.twitch.android.app@$twversion" "twitch-revanced-v$twversion"
# Patch Tiktok 
get_key_patch "tiktok"
get_tt_ver
patch "com.ss.android.ugc.trill@$ttversion -d huawei-app-gallery" "tiktok-revanced-v$ttversion"
