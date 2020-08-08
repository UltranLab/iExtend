//
//  iExtend+UIColor.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid RED")
        assert(green >= 0 && green <= 255, "Invalid GREEN")
        assert(blue >= 0 && blue <= 255, "Invalid BLUE")
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    convenience init(hexValue: Int) {
        self.init(
            red: (hexValue >> 16) & 0xFF,
            green: (hexValue >> 8) & 0xFF,
            blue: hexValue & 0xFF
        )
    }
    
    //    convenience init(hexValue hex: String, withAlpha alpha: CGFloat = 1.0) {
    //        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    //        if (cString.hasPrefix("#")) {
    //            cString.remove(at: cString.startIndex)
    //        }
    //
    //        if (cString.count != 6) {
    //            self.init(red: 255/255, green: 255/255, blue: 255/255, alpha: alpha) //Invalid Color
    //        } else {
    //            var rgbValue: UInt32 = 0
    //            Scanner(string: cString).scanHexInt32(&rgbValue)
    //
    //            self.init(
    //                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    //                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    //                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    //                alpha: alpha)
    //        }
    //    }
}
