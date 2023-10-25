import 'icon_switcher_platform_interface.dart';

class IconSwitcher {
  Future<String?> getIconName() {
    return IconSwitcherPlatform.instance.getIconName();
  }

  Future<bool> supportsAlternateIcons() {
    return IconSwitcherPlatform.instance.supportsAlternateIcons();
  }

  Future<void> setAlternateIconName({String? name}) {
    return IconSwitcherPlatform.instance.setAlternateIconName(name);
  }
}
