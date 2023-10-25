class IconSwitcherManager { 
    static let instance = IconSwitcherManager();

    public var currentIcon: String? { 
        return UIApplication.shared.alternateIconName
    }

    public var supportsAlternateIcons: Bool {
        return UIApplication.shared.supportsAlternateIcons;
    }

    public func setAlternateIconName(name: String, result: FlutterResult) -> Void { 
        guard current != name, UIApplication.shared.supportsAlternateIcons else { 
            return
        }

        UIApplication.shared.setAlternateIconName(appIcon.name) { error in
            if let error = error {
                print("Error setting alternate icon \(appIcon.name ?? ""): \(error.localizedDescription)")
            }

            //completion?(error != nil)
        }
    }
}