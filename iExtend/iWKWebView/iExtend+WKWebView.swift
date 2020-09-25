//
//  iExtend+WKWebView.swift
//  iExtend
//
//  Created by ULTLab on 09/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation
import WebKit

public extension WKWebView {
    class func clearCache() {
        guard #available(iOS 9.0, *) else { return }
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }
    func load(withData data: IWKWebView) {
        var finalData: String = data.html
        if data.enableScale {
            let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=\(data.initialScale < 0.6 ? 1.0 : data.initialScale), maximum-scale=\(data.maxScale < 0.6 ? 1.0 : data.maxScale), minimum-scale=\(data.minScale < 0.6 ? 1.0 : data.minScale), user-scalable=no'></header>"
            finalData = headerString + finalData
        }
        self.loadHTMLString(finalData, baseURL: nil)
    }
    func disableSelection() {
        let fakeStyle: String = "var css = '*{-webkit-touch-callout:none;-webkit-user-select:none}'; var head = document.head || document.getElementsByTagName('head')[0]; var style = document.createElement('style'); style.type = 'text/css'; style.appendChild(document.createTextNode(css)); head.appendChild(style);"
        self.evaluateJavaScript(fakeStyle)
    }
}
