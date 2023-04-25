#!/bin/bash
for repos in revanced-patches revanced-cli revanced-integrations; do
    url="https://api.github.com/repos/inotia00/$repos/releases/latest"
    curl -s "$url" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
EXCLUDE_PATCHES=()
for word in $(cat exclude-patches.txt) ; do
    EXCLUDE_PATCHES+=("-e $word")
done
ytversion=$(jq -r '.[] | select(.name == "hide-general-ads") | .compatiblePackages[] | select(.name == "com.google.android.youtube") | .versions[-1]' patches.json)
chmod +x apkeep && ./apkeep -a com.google.android.youtube@$ytversion .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar ${EXCLUDE_PATCHES[@]} -a com.google.android.youtube*.apk --keystore=ks.keystore -o yt-v$ytversion.apk
