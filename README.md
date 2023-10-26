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

You'll end up with something like the example below:

```
<key>CFBundleIcons</key>
<dict>
  <key>CFBundlePrimaryIcon</key>
  <dict>
    <key>CFBundleIconFiles</key>
    <array>
      <string>app-icon</string>
    </array>
    <key>UIPrerenderedIcon</key>
    <false/>
  </dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>app-icon-son</key> // This is your reference in code
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>app-icon-son</string> // This is the name of the file, excluding @2x.png
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
  </dict>
</dict>
```

## Usage

to `/example` folder.

```dart
FutureBuilder(
  future: Future.wait([
    // Check if the app supports multiple icons, iOS only
    _iconSwitcher.supportsAlternateIcons(),
    // Get the name of the icon currently configured
    _iconSwitcher.getIconName(),
  ]),
  builder: (context, snapshot) {
    return Container(
      child: Column(
        children: [
          Text('Can switch icons: ${snapshot.data?[0]}'),
          Text('Current icon is: ${snapshot.data?[1]}'),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Primary'),
                onPressed: () async {
                  // Switch back to the default app icon
                  await _iconSwitcher.setAlternateIconName();
                },
              ),
              ElevatedButton(
                child: Text('Primary'),
                onPressed: () async {
                  // Switch to a different icon
                  await _iconSwitcher.setAlternateIconName(name: 'app-icon-son');
                },
              ),
            ],
          )
        ],
      ),
    );
  },
);
```
