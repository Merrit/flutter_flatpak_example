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

> Note: Building a flatpak should be done in a predictable environment or it may
> fail.
> 
> There is a [GitHub
> action](https://github.com/bilelmoussaoui/flatpak-github-actions) for this
> purpose, which is demonstrated in this repo. This action's page also lists the
> docker containers it uses.
> 
> If you fork this example repo you can run the [example workflow](https://github.com/Merrit/flutter_flatpak_example/blob/main/.github/workflows/flatpak.yml), and
> install the `.flatpak` file it generates with `flatpak install <path-to-.flatpak>`.


Get Flutter project dependencies:

```
flutter pub get
```


Build linux version:

```
flutter build linux
```


Compress linux build:

```
tar -C build/linux/x64/release/bundle -acvf FlutterApp-Linux-Portable.tar.gz .
```


Instruct `flatpak-builder` to use the manifest to do a flatpak build:

```
flatpak-builder --force-clean build-dir com.example.FlutterApp.json
```

_Optional:_

To build and immediately install the flatpak it produces add `--user --install` to the build command, for example:

```
flatpak-builder --force-clean build-dir com.example.FlutterApp.json --user --install
```

or to create a `.flatpak` file that can later be installed on any system:

```
flatpak-builder --force-clean build-dir com.example.FlutterApp.json --repo=repo
flatpak build-bundle repo com.example.FlutterApp.flatpak com.example.FlutterApp
```

Will generate `com.example.FlutterApp.flatpak`, which can be installed on any system with Flatpak support:

```
flatpak install com.example.FlutterApp.flatpak
```

## Publish to app store

When this succeeds you can proceed to [submit to an app store like Flathub](https://github.com/flathub/flathub/wiki/App-Submission).
