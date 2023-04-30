#!/bin/bash
source ./src/patch.sh
get_patch "revanced"
# Patch Messenger
get_key_patch "messenger"
patch "com.facebook.orca" "messenger-revanced.apk"
