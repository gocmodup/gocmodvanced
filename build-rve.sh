#!/bin/bash
# Revanced Extended build
source tools.sh
release=$(curl -s "https://api.github.com/repos/inotia00/revanced-patches/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name | test("revanced-patches.*\\.jar$")) | .browser_download_url')
curl -sL -O "$asset"
ls revanced-patches*.jar >> new.txt
rm -f revanced-patches*.jar
release=$(curl -s "https://api.github.com/repos/luxysiv/revanced-build/releases/latest")
asset=$(echo "$release" | jq -r '.assets[] | select(.name == "revanced-extended-version.txt") | .browser_download_url')
curl -sL -O "$asset"
if diff -q revanced-extended-version.txt new.txt >/dev/null ; then
echo "Old patch!!! Not build"
exit 1
else
rm -f *.txt
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
ls revanced-patches*.jar >> revanced-extended-version.txt
fi