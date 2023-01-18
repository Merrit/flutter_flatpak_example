- [Flutter Flatpak Example](#flutter-flatpak-example)
  - [Requirements](#requirements)
    - [VSCode dev container](#vscode-dev-container)
    - [GitHub actions](#github-actions)
    - [Manual Requirements](#manual-requirements)
  - [Instructions](#instructions)


# Flutter Flatpak Example


An example of how to package a Flutter application as a Flatpak for distribution
on Linux, using the default counter example app.

[Flatpak documentation](https://docs.flatpak.org/en/latest/index.html)



## Requirements

> Note: Building a flatpak should be done in a predictable environment or it may
> fail.

[Set up Flathub](https://flatpak.org/setup/), and choose one:

### VSCode dev container

Use the VSCode dev container provided in this repo that will run everything
through Docker

1. Install the [Dev
   Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
   extension
   
2. Open this directory in VSCode.

3. Accept the prompt to re-open in the dev container, or from the Command
   Palette search for `Reopen in Container`


### GitHub actions

> There is a [GitHub
> action](https://github.com/bilelmoussaoui/flatpak-github-actions) for this
> purpose, which is demonstrated in this repo. This action's page also lists the
> docker containers it uses.
> 
> If you fork this example repo you can run the [example workflow](https://github.com/Merrit/flutter_flatpak_example/blob/main/.github/workflows/flatpak.yml), and
> install the `.flatpak` file it generates with `flatpak install <path-to-.flatpak>`.


### Manual Requirements
 
> - flatpak
> - flatpak-builder
> 
> On ubuntu:
> 
> > sudo apt install flatpak flatpak-builder


## Instructions

We have two directories that each represent what would be separate git
repositories for a real project:

`counter_app` is the Flutter app, view the README there for info on
configuration and building.

`flathub_repo` is separate from the Flutter app and is where the Flatpak is
assembled, view the README there for info on configuration, building, and
publishing of the flatpak after building the `counter_app`.
