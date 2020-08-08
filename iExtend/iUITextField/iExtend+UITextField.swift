//
//  iExtend+UITextField.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UITextField {
    var leftSpace: CGFloat {
        get {
            return self.leftView?.frame.size.width ?? 0
        }
        set {
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.leftViewMode = .always
        }
    }
    var rightSpace: CGFloat {
        get {
            return self.rightView?.frame.size.width ?? 0
        }
        set {
            self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.rightViewMode = .always
        }
    }
    func customize(placeHolder placeHolderText: String? = nil,
                   text inputText: String? = nil,
                   addLowerBorder showLowerBorder: Bool = false,
                   textColor textColorOfField: UIColor? = .black,
                   placeHolderColor placeholderColor: UIColor? = UIColor.black.withAlphaComponent(0.5),
                   textFont textFontObject: UIFont? = UIFont.systemFont(ofSize: 10),
                   placeHolderFont placeHolderFontObject: UIFont? = UIFont.systemFont(ofSize: 9),
                   borderColor viewBorderColor: UIColor = .clear,
                   borderHeight viewBorderHeight: CGFloat? = nil,
                   keyBoardType keyBoardTypeForFields: UIKeyboardType = .default,
                   keyBoardStyle keyBoardColor: UIKeyboardAppearance = .default,
                   returnKey returnType: UIReturnKeyType = .done,
                   allignment allign: NSTextAlignment = .left,
                   isSecureEntry secured: Bool = false) {
        //Setting all the values to default to remove any predefination on storyboard etc.
        self.text = inputText
        self.textAlignment = allign
        if let placeHolderColorCheck = placeholderColor,
            let placeHolderFontObjectCheck = placeHolderFontObject,
            let placeHolderTextCheck = placeHolderText,
            !placeHolderTextCheck.isEmpty{
            let attributesToApply = [NSAttributedString.Key.foregroundColor: placeHolderColorCheck, NSAttributedString.Key.font : placeHolderFontObjectCheck]
            self.attributedPlaceholder = NSAttributedString(string: placeHolderTextCheck, attributes: attributesToApply)
        } else {
            self.attributedPlaceholder = nil
        }
        self.textColor = (textColorOfField != nil) ? textColorOfField : .black
        self.keyboardAppearance = keyBoardColor
        self.returnKeyType = returnType
        self.keyboardType = keyBoardTypeForFields //(keyBoardTypeForFields != nil) ? keyBoardTypeForFields! : .default
        self.font = (textFontObject != nil) ? textFontObject! : (placeHolderFontObject != nil) ? placeHolderFontObject! : self.font?.withSize(15)
        self.isSecureTextEntry = secured
        switch showLowerBorder {
        case true:
            let borderObject: CALayer = CALayer()
            borderObject.backgroundColor = viewBorderColor.cgColor
            if let borderHeightCheck = viewBorderHeight {
                borderObject.frame = CGRect(x: 0, y: self.frame.height - 1, width: (self.frame.width * 2), height: borderHeightCheck)
            } else {
                borderObject.frame = CGRect(x: 0, y: self.frame.height - 1.0, width: (self.frame.width * 2), height: 1.0)
            }
            self.borderStyle = .none
            self.layer.addSublayer(borderObject)
            self.layer.masksToBounds = true
            
        case false:
            if let borderHeightCheck = viewBorderHeight {
                self.layer.borderColor = viewBorderColor.cgColor
                self.layer.borderWidth = borderHeightCheck
            } else {
                self.layer.borderColor = nil
                self.layer.borderWidth = 0.0
            }
        }
    }
}
