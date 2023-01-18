#!/bin/bash


# Build the Flutter app and package into an archive.


# Exit if any command fails
set -e

# Echo all commands for debug purposes
set -x


projectName=FlutterApp

archiveName=$projectName-Linux-Portable.tar.gz
baseDir=$(pwd)


# ----------------------------- Build Flutter app ---------------------------- #


flutter pub get
flutter build linux

cd build/linux/x64/release/bundle || exit
tar -czaf $archiveName ./*
mv $archiveName "$baseDir"/
