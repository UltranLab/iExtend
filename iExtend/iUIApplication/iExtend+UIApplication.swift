//
//  iExtend+UIApplication.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIApplication {
    class func topViewController(isNavBarHidden hidden: Bool = true) -> UIViewController? {
        guard let topWidndow = topWindow(),
            var topViewController = topWidndow.rootViewController else { return nil }
        while let currentView = topViewController.presentedViewController {
            topViewController = currentView
        }
        topViewController.navigationController?.isNavigationBarHidden = hidden
        return topViewController
    }
    class func topWindow() -> UIWindow? {
        var keyWindow: UIWindow?
        if #available(iOS 13.0, *) {
            keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }
        return keyWindow
    }
}
