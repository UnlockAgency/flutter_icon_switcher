import Foundation
import Flutter
import UIKit

class IconSwitcherManager { 
    static let instance = IconSwitcherManager();

    public var currentIcon: String? { 
        return UIApplication.shared.alternateIconName
    }

    public var supportsAlternateIcons: Bool {
        return UIApplication.shared.supportsAlternateIcons;
    }

    public func setAlternateIconName(name: String? = nil, result: @escaping FlutterResult) -> Void { 
        guard currentIcon != name, UIApplication.shared.supportsAlternateIcons else { 
            result(currentIcon)
            return
        }

        UIApplication.shared.setAlternateIconName(name) { [weak self] error in
            if let error = error {
                print("Error setting alternate icon \(name ?? "primary"): \(error.localizedDescription)")
                result(FlutterError(code: "418", message: "The icon could not be changed: \(error.localizedDescription)", details: nil))
                return
            }

            result(self?.currentIcon ?? nil)
        }
    }
}