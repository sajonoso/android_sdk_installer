#!/bin/sh
# This sciprt is used to check the version of an .aab file
# source: https://stackoverflow.com/questions/60155905/how-do-i-get-the-versioncode-and-versionname-badging-of-an-android-aab-file

unzip -p $1 base/manifest/AndroidManifest.xml > AndroidManifest.xml
# Create a dummy .apk with the proto-formatted AndroidManifest.xml
zip proto_version.apk AndroidManifest.xml
# Convert the proto-formatted AndroidManifest.xml into an apk-formatted XML
aapt2 convert proto_version.apk -o version.apk
# Now dump the badging
aapt dump badging version.apk
