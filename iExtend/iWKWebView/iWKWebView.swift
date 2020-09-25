//
//  iWKWebView.swift
//  iExtend
//
//  Created by Tuhin S on 21/09/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public final class IWKWebView {
    var html: String
    var enableScale: Bool
    var initialScale: Double //>=0.6
    var maxScale: Double //>=0.6
    var minScale: Double //>=0.6
    init(withHTML htm: String, enableScale eScale: Bool = false,
         initialScale initScale: Double = 0.6, maxScale maScale: Double = 0.6,
         minScale miScale: Double = 0.6) {
        self.html = htm
        self.initialScale = initScale
        self.maxScale = maScale
        self.minScale = miScale
        self.enableScale = eScale
    }
}
