//
//  iExtend+Dictionary.swift
//  iExtend
//
//  Created by Tuhin on 03/01/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Dictionary where Key: ExpressibleByStringLiteral {
    mutating func lowercasedKeys() {
        for key in self.keys {
            self[String(describing: key).lowercased() as! Key] = self.removeValue(forKey: key)
        }
    }
}
