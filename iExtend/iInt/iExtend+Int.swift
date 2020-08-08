//
//  iExtend+Int.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Int{
    var boolValue: Bool { return self != 0 }
    var SmoothApiStatus: SmoothApiStatusCodes {
        guard let apiErrorCheck = SmoothApiStatusCodes(rawValue: self) else { return .unauthorized }
        return apiErrorCheck
    }
    var addOrdinalValue: String {
        get {
            var suffix = "th"
            switch self % 10 {
            case 1:
                suffix = "st"
            case 2:
                suffix = "nd"
            case 3:
                suffix = "rd"
            default:
                break
            }
            if 10 < (self % 100) && (self % 100) < 20 {
                suffix = "th"
            }
            return String(self) + suffix
        }
    }
}
