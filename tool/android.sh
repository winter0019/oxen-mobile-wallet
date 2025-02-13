#!/bin/bash

if ! [ -e "pubspec.yaml" ] || ! [ -d "oxen_coin" ]; then
    echo "Error: this script must be invoked from the top-level project directory" >&2
    exit 1
fi

set -e -x

./tool/download-android-deps.sh https://oxen.rocks/oxen-io/oxen-core/oxen-stable-android-deps-LATEST.tar.xz

flutter pub get

flutter pub upgrade

flutter pub run build_runner build --delete-conflicting-outputs

flutter pub run flutter_launcher_icons:main

flutter build apk --split-per-abi

flutter build appbundle
