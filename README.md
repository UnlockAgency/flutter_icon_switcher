# Icon switcher

Programmatically switch the app icon. **Only available for iOS.**

## Installation

Add the package as dependency to your `pubspec.yaml` file and run `flutter pub get`:

```yaml
dependencies:
  icon_switcher:
    git:
      url: https://github.com/UnlockAgency/flutter_icon_switcher.git
      ref: v1.0.0
```

Where the `ref` can be any valid Git reference, for instance: branch name or tag.

## Getting started

1. Design new app icons and export them in two sizes: 120px (60px @x2) and 180 (60px @3x).
1. Place these new files in the project folder (**not in the assets**).
1. Add a `CFBundleIcons` entry to the `Info.plist` file.
1. Within the new entry, add a `CFBundleAlternateIcons` key.

Next, for each alternate icon, add a new entry under `CFBundleAlternateIcons`. The name of the entry is the name of the icon which will be used as reference in the code. The string value of the item is the name of the icon file that you added in the project.


## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```
