# Example app

This is the default Flutter `Counter` example app.

The only changes are the addition of configuration files necessary for Flatpak,
as follows:

- `assets/icons/com.example.FlutterApp.svg` -- app's icon
- `packaging/linux/com.example.FlutterApp.desktop` -- desktop app menu integration
- `packaging/linux/com.example.FlutterApp.metainfo.xml` -- AppStream metadata
  file that contains the information about the app that would be presented on an
  app store like Flathub


## Build the Flutter app and package into an archive.

**This should be built on an older version on Linux so that it will run on the
widest possible set of Linux installations. Recommend docker or a CI pipeline
like GitHub actions using the oldest supported Ubuntu LTS.**

```bash
./build-flutter-app.sh
```
