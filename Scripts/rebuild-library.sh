#!/bin/bash

cd "$(dirname "$0")"
cd ../
mkdir tmp
cd tmp
git clone https://github.com/rclone/rclone
cd rclone
go build --buildmode=c-archive -o build/librclone.a github.com/rclone/rclone/librclone
mkdir build/headers
mv build/librclone.h build/headers
xcodebuild -create-xcframework -library build/librclone.a -headers build/headers -output librclone.xcframework
rm -rf ../../Libs/librclone.xcframework
mv librclone.xcframework ../../Libs
cd ../../
rm -rf tmp