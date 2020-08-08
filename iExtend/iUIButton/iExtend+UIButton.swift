//
//  iExtend+UIButton.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIButton {
    func customize(with text: String,
                   textColor colorOfTxt: UIColor = .white,
                   textFont fontOfTxt: UIFont,
                   horizontalAlignment horizontalAlignmentType:
        UIControl.ContentHorizontalAlignment = .center,
                   verticalAlignment verticalAlignmentType:
        UIControl.ContentVerticalAlignment = .center,
                   edgeInsets edgeInsetsOfBtn: UIEdgeInsets? = nil){
        self.titleLabel?.font = fontOfTxt
        self.setTitleColor(colorOfTxt, for: .normal)
        self.contentHorizontalAlignment = horizontalAlignmentType
        self.contentVerticalAlignment = verticalAlignmentType
        if let edgeInsets = edgeInsetsOfBtn{
            self.contentEdgeInsets = edgeInsets
        }
        if !text.isEmpty{
            self.setTitle(text, for: .normal)
        }
    }
}
