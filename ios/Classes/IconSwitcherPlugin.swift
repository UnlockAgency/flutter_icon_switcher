import Flutter
import UIKit

public class IconSwitcherPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "icon_switcher", binaryMessenger: registrar.messenger())
    let instance = IconSwitcherPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "supportsAlternateIcons":
      let support = IconSwitcherManager.instance.supportsAlternateIcons
      result(support)
    case "setAlternateIconName":
      guard let arguments = call.arguments as? [String: Any] else {
        result(FlutterError(code: "418", message: "Invalid data passed", details: nil))
        return
      }

      IconSwitcherManager.instance.setAlternateIconName(
        name: arguments["name"] as? String, 
        result: result
      )
    case "getIconName":
      let name = IconSwitcherManager.instance.currentIcon
      result(name)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
