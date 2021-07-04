# Description

A helper script to install just the Android SDK without the Android Studio

Google has made it difficult to just install the tools required to compile Android programs:

see: https://stackoverflow.com/questions/60440509/android-command-line-tools-sdkmanager-always-shows-warning-could-not-create-se

They have made frequent and unnecessary changes to the SDK to constantly break automated compilations.

One such example is changing the variable used to determine the location of the android SDK.

see: https://developer.android.com/studio/command-line/variables

This variable has changed from ANDROID_HOME to ANDROID_SDK_ROOT to ANDROID_PREFS_ROOT
I can not see any good reason to rename such a key variable

They have also removed the Android emulator from being installable by the sdkmanager, which was the motivation to create this script
