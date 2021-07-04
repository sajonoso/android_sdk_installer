#!/bin/sh

# set where you want to install the SDK
ANDROID_SDK_ROOT=~/.android/sdk
ANDROID_PREFS_ROOT=$ANDROID_SDK_ROOT

Version 30.7.2 - latest as at 1 June 2021
# https://dl.google.com/android/repository/emulator-darwin_x64-7395805.zip
# https://dl.google.com/android/repository/emulator-linux_x64-7395805.zip
# https://dl.google.com/android/repository/emulator-windows_x64-7395805.zip

CMDTOOLS_FILE=commandlinetools-win-7302050_latest.zip
EMULATOR_FILE=emulator-windows_x64-7395805.zip

# change to sdkmanager for linux/mac or sdkmanager.bat for windows same for avdmanager
SDKMAN=sdkmanager.bat
AVDMAN=avdmanager.bat

BASE_URL=https://dl.google.com/android/repository
PREFIX=.

# Download the two minimum required files
curl -O $BASE_URL/$EMULATOR_FILE
curl -O $BASE_URL/$CMDTOOLS_FILE

mkdir -p $ANDROID_SDK_TOOLS/cmdline-tools
unzip $PREFIX/$CMDTOOLS_FILE -d $ANDROID_SDK_TOOLS/cmdline-tools
mv $ANDROID_SDK_TOOLS/cmdline-tools/cmdline-tools $ANDROID_SDK_TOOLS/cmdline-tools/latest
unzip $PREFIX/$EMULATOR_FILE -d $ANDROID_SDK_TOOLS
cp package.xml $ANDROID_SDK_TOOLS/emulator

# Install the minimum set of tools to compile and Android app
# patcher:v4 and tools will be automatically installed
$SDKMAN "platform-tools platforms;android-30 build-tools;29.0.3"


# install an emulator image before creating a virtual device
# $SDKMAN "system-images;android-23;google_apis;x86"


# CREATE EMULATOR
# $AVDMAN create avd --name "avd6" --sdcard 256M --package "system-images;android-23;google_apis;x86" --device "Nexus 5"

# LAUNCH EMULATOR
#  emulator -avd avd6 -gpu host -memory 1536 -no-boot-anim -nojni &

