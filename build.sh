#!/bin/bash
source ./src/patch.sh
# Patch Messenger
get_patch "revanced"
get_key_patch "messenger"
patch "com.facebook.orca" "messenger-revanced.apk"
