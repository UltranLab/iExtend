//
//  iExtend+Generics.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

internal let letters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
internal let numbers: String = "0123456789"
internal let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
public let okString: String = "OK"
public let cancelStr: String = "Cancel"

public struct IExtend {
    public static func generateRandomString(size randomSize: UInt = 20) -> String {
        let prefixS = Int(min(randomSize, 43))
        let uuidStr = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        return String(Data(uuidStr.utf8).base64EncodedString().replacingOccurrences(of: "=", with: "").prefix(prefixS))
    }
}

public extension Collection where Element: Hashable {
    var scrapDuplicates: [Element]  {
        var set = Set<Element>()
        return compactMap { set.insert($0).inserted ? $0 : nil }
    }
}
