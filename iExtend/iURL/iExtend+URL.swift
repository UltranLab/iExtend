//
//  iExtend+URL.swift
//  iExtend
//
//  Created by Tuhin S on 09/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension URL {
    func status() -> Bool {
        guard !self.absoluteString.isEmpty else { return false }
        return UIApplication.shared.canOpenURL(self)
    }
    func open() {
        guard self.status() else { return }
        Thread.onMainThread {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    static func openAppStoreUrl(isClearData clear: Bool = false) {
        SPLogEngine.debugLog(for: "Trying to open app store url from here!")
        guard let itunesUrlC = URL(string: SPAppStore.appStoreUrl) else {
            SPLogEngine.debugLog(for: "Invalid App Store Url!")
            return
        }
        openWith(url: itunesUrlC)
        if clear { self.logout() }
    }
    static func openRateUs(isClearData clear: Bool = false) {
        SPLogEngine.debugLog(for: "Trying to open app rate us url from here!")
        guard let itunesUrlC = URL(string: SPAppStore.rateUsPage) else {
            SPLogEngine.debugLog(for: "Invalid App Store Rate Us Url!")
            return
        }
        openWith(url: itunesUrlC)
        if clear { self.logout() }
    }
    static func openAppStorePage(isClearData clear: Bool = false) {
        SPLogEngine.debugLog(for: "Trying to open app store page from here!")
        guard let itunesUrlC = URL(string: SPAppStore.appStorePage) else {
            SPLogEngine.debugLog(for: "Invalid App Store Page Url!")
            return
        }
        openWith(url: itunesUrlC)
        if clear { self.logout() }
    }
}
