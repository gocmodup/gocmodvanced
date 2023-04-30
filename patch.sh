#!/bin/bash
get_patch() {
for repos in revanced-patches revanced-cli revanced-integrations; do
    curl -s "https://api.github.com/repos/revanced/$repos/releases/latest" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
}
get_key_patch() {
EXCLUDE_PATCHES=()
for word in $(cat exclude-patches.txt) ; do
    EXCLUDE_PATCHES+=("-e $word")
done
INCLUDE_PATCHES=()
for word in $(cat include-patches.txt) ; do
    INCLUDE_PATCHES+=("-i $word")
done
}
patch () {
chmod +x apkeep && ./apkeep -a $1 .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar -a $1.apk --keystore=ks.keystore -o $2
}
get_patch
patch "com.facebook.orca" "messenger-revanced.apk"