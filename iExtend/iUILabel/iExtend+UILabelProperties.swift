//
//  iExtend+UIProperties.swift
//  iExtend
//
//  Created by ULTLab on 07/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public final class IUILabel {
    var text: String?
    var textColor: UIColor
    var backgroundColor: UIColor
    var font: UIFont
    var textAlignment: NSTextAlignment
    var numberOfLines: Int
    var sizeToFit: Bool
    init(withText txt: String? = nil, textColor tColor: UIColor,
         backgroundColor bColor: UIColor, font fnt: UIFont,
         textAlignment algnment: NSTextAlignment = .left,
         numberOfLines nLines: Int, sizeToFit fitSize: Bool) {
        self.text = txt
        self.textColor = tColor
        self.backgroundColor = bColor
        self.font = fnt
        self.textAlignment = algnment
        self.numberOfLines = nLines
        self.sizeToFit = fitSize
    }
}

