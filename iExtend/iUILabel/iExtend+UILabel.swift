//
//  iExtend+UILabel.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UILabel {
    func customize(with text: String? = nil,
                   textColor colorOfTxt: UIColor,
                   textFont fontOfTxt: UIFont,
                   lblAlignment alignmentTypeOfLbl: NSTextAlignment?,
                   numberOfLines lineNumber: Int = 0,
                   fitSize sizeFit: Bool = false) {
        self.font = fontOfTxt
        self.textColor = colorOfTxt
        self.numberOfLines = lineNumber
        self.textAlignment = (alignmentTypeOfLbl != nil) ? alignmentTypeOfLbl! : .left
        self.text = text
        if let textC = text, !textC.isEmpty, sizeFit {
            self.sizeToFit()
        }
    }
    func customize(withData data: IUILabel) {
        self.font = data.font
        self.textColor = data.textColor
        self.numberOfLines = data.numberOfLines
        self.textAlignment = data.textAlignment
        if data.text == nil {
            self.text = nil
        } else if let text = data.text, !text.isEmpty {
            self.text = text
            guard data.sizeToFit else { return }
            self.sizeToFit()
        }
    }
//    func attributedText(withData data: IUILabel) {
//        self.font = data.font
//        self.textColor = data.textColor
//        self.numberOfLines = data.numberOfLines
//        self.textAlignment = data.textAlignment
//        if data.text == nil {
//            self.text = nil
//        } else if let text = data.text, !text.isEmpty {
//            self.text = text
//            guard data.sizeToFit else { return }
//            self.sizeToFit()
//        }
//    }
}
