import 'package:flutter_test/flutter_test.dart';
import 'package:icon_switcher/icon_switcher.dart';
import 'package:icon_switcher/icon_switcher_platform_interface.dart';
import 'package:icon_switcher/icon_switcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIconSwitcherPlatform with MockPlatformInterfaceMixin implements IconSwitcherPlatform {
  @override
  Future<String?> getIconName() async {
    return 'app';
  }

  @override
  Future<void> setAlternateIconName(String? name) async {
    return;
  }

  @override
  Future<bool> supportsAlternateIcons() async {
    return true;
  }
}

void main() {
  final IconSwitcherPlatform initialPlatform = IconSwitcherPlatform.instance;

  test('$MethodChannelIconSwitcher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIconSwitcher>());
  });

  test('getPlatformVersion', () async {
    IconSwitcher iconSwitcherPlugin = IconSwitcher();
    MockIconSwitcherPlatform fakePlatform = MockIconSwitcherPlatform();
    IconSwitcherPlatform.instance = fakePlatform;

    expect(await iconSwitcherPlugin.getIconName(), '42');
  });
}
