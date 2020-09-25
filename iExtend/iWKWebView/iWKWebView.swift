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
    var initialScale: Double
    var maxScale: Double
    var minScale: Double
    init(withHTML htm: String, enableScale eScale: Bool = false,
         initialScale initScale: Double = 1.0, maxScale maScale: Double = 1.0,
         minScale miScale: Double = 1.0) {
        self.html = htm
        self.initialScale = initScale
        self.maxScale = maScale
        self.minScale = miScale
        self.enableScale = eScale
    }
}
