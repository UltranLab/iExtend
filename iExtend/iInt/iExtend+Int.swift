//
//  iExtend+Int.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Int {
    var boolValue: Bool { return self != 0 }
    var iStatusCode: IStatusCode {
        guard let apiErrorCheck = IStatusCode(rawValue: self) else { return .unauthorized }
        return apiErrorCheck
    }
    func format(withSeparator seperator: String = ",") -> String {
        let response = String(self)
        guard !seperator.isEmpty else { return response }
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = seperator
        guard let respns = formatter.string(from: NSNumber(value: self)) else { return response }
        return respns
    }
    func formatWithLeading() -> String {
        return (self >= 0) ? ((self < 10) ? "0\(self)" : "\(self)") : "00"
    }
    var uxFriendly: String {
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
