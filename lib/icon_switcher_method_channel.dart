import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'icon_switcher_platform_interface.dart';

/// An implementation of [IconSwitcherPlatform] that uses method channels.
class MethodChannelIconSwitcher extends IconSwitcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('icon_switcher');

  @override
  Future<bool> supportsAlternateIcons() async {
    final version = await methodChannel.invokeMethod<bool>('supportsAlternateIcons');
    return version ?? false;
  }

  @override
  Future<String?> setAlternateIconName(String? name) async {
    return await methodChannel.invokeMethod<String?>('setAlternateIconName', {'name': name});
  }

  @override
  Future<String?> getIconName() async {
    return await methodChannel.invokeMethod<String?>('getIconName');
  }
}
