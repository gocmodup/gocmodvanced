#!/bin/bash
# Revanced build
source tools.sh
release=$(curl -s "https://api.github.com/repos/revanced/revanced-patches/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name | test("revanced-patches.*\\.jar$")) | .browser_download_url')
curl -sL -O "$asset"
ls revanced-patches*.jar >> new.txt
rm -f revanced-patches*.jar
release=$(curl -s "https://api.github.com/repos/luxysiv/revanced-build/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name == "revanced-version.txt") | .browser_download_url')
curl -sL -O "$asset"
if diff -q patch-version.txt new.txt >/dev/null ; then
    echo "Old patch!!! Not build"
    exit 1
else
    rm -f *.txt
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
ls revanced-patches*.jar >> revanced-version.txt
fi