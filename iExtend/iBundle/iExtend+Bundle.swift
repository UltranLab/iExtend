//
//  iExtend+Bundle.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Bundle {
    var releaseVersion: String {
        guard let result = infoDictionary?["CFBundleShortVersionString"] as? String, !result.isEmpty else {
            assert(false)
            return "1.0"
        }
        return result
    }
    var buildVersion: String {
        guard let result = infoDictionary?["CFBundleVersion"] as? String, !result.isEmpty else {
            assert(false)
            return "1.0"
        }
        return result
    }
    var releaseVersionPretty: String {
        return "v\(releaseVersion)"
    }
    var buildVersionPretty: String {
        return "b\(buildVersion)"
    }
    var fullVersion: String {
        return "\(releaseVersion)\\\(buildVersion)"
    }
}
