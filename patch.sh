#!/bin/bash
get_patch() {
for repos in revanced-patches revanced-cli revanced-integrations; do
    curl -s "https://api.github.com/repos/revanced/$repos/releases/latest" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
}
get_key_patch() {
patches=()
if [[ -n "$(cat exclude-patches.txt)" ]]; then
    while read -r patch; do
        PATCHES+=("-e $patch")
    done <<< "$(cat exclude-patches.txt)"
fi
if [[ -n "$(cat include-patches.txt)" ]]; then
    while read -r patch; do
        PATCHES+=("-i $patch")
    done <<< "$(cat include-patches.txt)"
fi
}
patch () {
chmod +x apkeep && ./apkeep -a $1 .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar -a $1.apk ${patches[@]} --keystore=ks.keystore -o $2
}
get_patch
patch "com.facebook.orca" "messenger-revanced.apk"