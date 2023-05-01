#!/bin/bash
# Revanced build
source tools.sh
dl_gh "revanced" 
# Messenger
get_patches_key "messenger"
dl_mes
patch "messenger" "messenger-revanced"
# Patch Twitch
get_patches_key "twitch"
get_tw_ver
dl_twitch
patch "twitch" "twitch-revanced"
# Patch Tiktok 
get_patches_key "tiktok"
get_tt_ver
dl_tt
patch "tiktok" "tiktok-revanced"
# Patch YouTube 
get_patches_key "youtube-revanced"
get_ytrv_ver
dl_yt
patch "youtube" "youtube-revanced"
# Patch Twitch
get_patches_key "youtube-music-revanced"
get_ytmsrv_ver
dl_ytms
patch "youtube-music" "youtube-music-revanced"
