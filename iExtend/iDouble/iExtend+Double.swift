//
//  iExtend+Double.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Double {
    var uxFriendly: String {
        if self >= 1000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }
        if self > 999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }
        return String(format: "%.0f", locale: Locale.current,self)
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
    func toInt() -> Int {
        return (self >= Double(Int.min) && self < Double(Int.max)) ? Int(self) : 0
    }
}
