#!/bin/bash
# Revanced Extended build
source tools.sh
dl_gh "inotia00"
# Patch YouTube Extended

get_patches_key "youtube-revanced-extended"
get_ytrve_ver
dl_yt
patch "youtube" "youtube-revanced-extended"
# Patch Twitch
get_patches_key "youtube-music-revanced-extended"
dl_ytms
patch "youtube-music" "youtube-music-revanced-extended"
