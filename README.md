# Flutter Flatpak Example


An example of how to package a Flutter application as a Flatpak for distribution
on Linux, using the default counter example app.

[Flatpak documentation](https://docs.flatpak.org/en/latest/index.html)

The necessary configuration files are in the root of the repository for ease of demonstration:

- `com.example.FlutterApp.desktop` -- desktop menu / icon integration
- `icon.svg` -- app's icon
- `com.example.FlutterApp.json` -- Flatpak manifest, instructions on how to build
  / assemble the flatpak
- `com.example.FlutterApp.metainfo.xml` -- AppStream metadata file that contains
  the information about the app that would be presented on an app store like Flathub


## Requirements

- flatpak
- flatpak-builder

On ubuntu:

> sudo apt install flatpak flatpak-builder

Also required: [Flathub setup](https://flatpak.org/setup/)


## Instructions


Get Flutter project dependencies

> flutter pub get

Build linux version

> flutter build linux

Compress linux build

> tar -C build/linux/x64/release/bundle -cvf FlutterApp-Linux-Portable.tar.gz .

Instruct `flatpak-builder` to use the manifest to do a flatpak build

> flatpak-builder --force-clean build-dir com.example.FlutterApp.json


## Publish to app store

When this succeeds you can proceed to [submit to an app store like Flathub](https://github.com/flathub/flathub/wiki/App-Submission).