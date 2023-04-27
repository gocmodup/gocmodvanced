#!/bin/bash
for repos in revanced-patches revanced-cli revanced-integrations; do
    curl -s "https://api.github.com/repos/revanced/$repos/releases/latest" | jq -r '.assets[].browser_download_url' | xargs -n 1 curl -sL -O
done
chmod +x apkeep && ./apkeep -a com.facebook.orca .
java -jar revanced-cli*.jar -m revanced-integrations*.apk -b revanced-patches*.jar ${EXCLUDE_PATCHES[@]} -a com.facebook.orca.apk --keystore=ks.keystore -o messenger-revanced.apk
