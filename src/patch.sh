#!/bin/bash
get_patch() {
for repos in revanced-patches revanced-cli revanced-integrations; do
    curl -s "https://api.github.com/repos/$1/$repos/releases/latest" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
}
get_key_patch() {
EXCLUDE_PATCHES=()
for word in $(cat $1/exclude-patches) ; do
    EXCLUDE_PATCHES+=("-e $word")
done
INCLUDE_PATCHES=()
for word in $(cat $1/include-patches) ; do
    INCLUDE_PATCHES+=("-i $word")
done
}
get_ver() {
version=$(jq -r '.[] | select(.name == $1) | .compatiblePackages[] | select(.name == "tv.twitch.android.app") | .versions[-1]' patches.json)
}
patch() {
chmod +x apkeep && ./apkeep -a $1 .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar -a $1.apk ${EXCLUDE_PATCHES[@]} ${INCLUDE_PATCHES[@]} --keystore=ks.keystore -o ./build/$2.ap
}
