#!/bin/bash
get_patch() {
for repos in revanced-patches revanced-cli revanced-integrations; do
    curl -s "https://api.github.com/repos/$1/$repos/releases/latest" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
}
get_key_patch() {
patches=()
if [[ -n "$(cat $1)" ]]; then
    while read -r patch; do
        PATCHES+=("-e $patch")
    done <<< "$(cat $1)"
fi
if [[ -n "$(cat $1)" ]]; then
    while read -r patch; do
        PATCHES+=("-i $patch")
    done <<< "$(cat $2)"
fi
}
patch () {
chmod +x apkeep && ./apkeep -a $1 .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar -a $1.apk ${patches[@]} --keystore=ks.keystore -o $2
}
get_patch "revanced"
get_key_patch "exclude-patches.txt" "include-patches.txt"
patch "com.facebook.orca" "messenger-revanced.apk"