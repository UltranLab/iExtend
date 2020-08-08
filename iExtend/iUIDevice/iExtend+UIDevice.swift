//
//  iExtend+UIDevice.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIDevice {
    var iDevice: IUIDevice {
        var systemInformation = utsname()
        uname(&systemInformation)
        let systemMirror = Mirror(reflecting: systemInformation.machine)
        let identifier = systemMirror.children.reduce("") { identifierValue, elementToCheck in
            guard let valueToCheck = elementToCheck.value as? Int8, valueToCheck != 0 else { return identifierValue }
            return identifierValue + String(UnicodeScalar(UInt8(valueToCheck)))
        }
        return identifier.iUIDevice
    }
}
public enum IUIDevice: String {
    case iPod51 = "iPod5,1"
    case iPod71 = "iPod7,1"
    case iPod91 = "iPod9,1"
    case iPhone31 = "iPhone3,1"
    case iPhone32 = "iPhone3,2"
    case iPhone33 = "iPhone3,3"
    case iPhone41 = "iPhone4,1"
    case iPhone51 = "iPhone5,1"
    case iPhone52 = "iPhone5,2"
    case iPhone53 = "iPhone5,3"
    case iPhone54 = "iPhone5,4"
    case iPhone61 = "iPhone6,1"
    case iPhone62 = "iPhone6,2"
    case iPhone72 = "iPhone7,2"
    case iPhone71 = "iPhone7,1"
    case iPhone81 = "iPhone8,1"
    case iPhone82 = "iPhone8,2"
    case iPhone84 = "iPhone8,4"
    case iPhone91 = "iPhone9,1"
    case iPhone93 = "iPhone9,3"
    case iPhone92 = "iPhone9,2"
    case iPhone94 = "iPhone9,4"
    case iPhone101 = "iPhone10,1"
    case iPhone104 = "iPhone10,4"
    case iPhone102 = "iPhone10,2"
    case iPhone105 = "iPhone10,5"
    case iPhone103 = "iPhone10,3"
    case iPhone106 = "iPhone10,6"
    case iPhone112 = "iPhone11,2"
    case iPhone114 = "iPhone11,4"
    case iPhone116 = "iPhone11,6"
    case iPhone118 = "iPhone11,8"
    case iPhone121 = "iPhone12,1"
    case iPhone123 = "iPhone12,3"
    case iPhone125 = "iPhone12,5"
    case iPhone128 = "iPhone12,8"
    case iPad21 = "iPad2,1"
    case iPad22 = "iPad2,2"
    case iPad23 = "iPad2,3"
    case iPad24 = "iPad2,4"
    case iPad31 = "iPad3,1"
    case iPad32 = "iPad3,2"
    case iPad33 = "iPad3,3"
    case iPad34 = "iPad3,4"
    case iPad35 = "iPad3,5"
    case iPad36 = "iPad3,6"
    case iPad611 = "iPad6,11"
    case iPad612 = "iPad6,12"
    case iPad75 = "iPad7,5"
    case iPad76 = "iPad7,6"
    case iPad711 = "iPad7,11"
    case iPad712 = "iPad7,12"
    case iPad41 = "iPad4,1"
    case iPad42 = "iPad4,2"
    case iPad43 = "iPad4,3"
    case iPad53 = "iPad5,3"
    case iPad54 = "iPad5,4"
    case iPad114 = "iPad11,4"
    case iPad115 = "iPad11,5"
    case iPad25 = "iPad2,5"
    case iPad26 = "iPad2,6"
    case iPad27 = "iPad2,7"
    case iPad44 = "iPad4,4"
    case iPad45 = "iPad4,5"
    case iPad46 = "iPad4,6"
    case iPad47 = "iPad4,7"
    case iPad48 = "iPad4,8"
    case iPad49 = "iPad4,9"
    case iPad51 = "iPad5,1"
    case iPad52 = "iPad5,2"
    case iPad111 = "iPad11,1"
    case iPad112 = "iPad11,2"
    case iPad63 = "iPad6,3"
    case iPad64 = "iPad6,4"
    case iPad73 = "iPad7,3"
    case iPad74 = "iPad7,4"
    case iPad81 = "iPad8,1"
    case iPad82 = "iPad8,2"
    case iPad83 = "iPad8,3"
    case iPad84 = "iPad8,4"
    case iPad89 = "iPad8,9"
    case iPad810 = "iPad8,10"
    case iPad67 = "iPad6,7"
    case iPad68 = "iPad6,8"
    case iPad71 = "iPad7,1"
    case iPad72 = "iPad7,2"
    case iPad85 = "iPad8,5"
    case iPad86 = "iPad8,6"
    case iPad87 = "iPad8,7"
    case iPad88 = "iPad8,8"
    case iPad811 = "iPad8,11"
    case iPad812 = "iPad8,12"
    case appleTV53 = "AppleTV5,3"
    case appleTV62 = "AppleTV6,2"
    case audioAccessory11 = "AudioAccessory1,1"
    case i386, x86_64, undefined
    var pretty: String {
        switch self {
        case .iPod51:                                   return "iPod touch (5th generation)"
        case .iPod71:                                   return "iPod touch (6th generation)"
        case .iPod91:                                   return "iPod touch (7th generation)"
        case .iPhone31, .iPhone32, .iPhone33:           return "iPhone 4"
        case .iPhone41:                                 return "iPhone 4s"
        case .iPhone51, .iPhone52:                      return "iPhone 5"
        case .iPhone53, .iPhone54:                      return "iPhone 5c"
        case .iPhone61, .iPhone62:                      return "iPhone 5s"
        case .iPhone72:                                 return "iPhone 6"
        case .iPhone71:                                 return "iPhone 6 Plus"
        case .iPhone81:                                 return "iPhone 6s"
        case .iPhone82:                                 return "iPhone 6s Plus"
        case .iPhone84:                                 return "iPhone SE"
        case .iPhone91, .iPhone93:                      return "iPhone 7"
        case .iPhone92, .iPhone94:                      return "iPhone 7 Plus"
        case .iPhone101, .iPhone104:                    return "iPhone 8"
        case .iPhone102, .iPhone105:                    return "iPhone 8 Plus"
        case .iPhone103, .iPhone106:                    return "iPhone X"
        case .iPhone112:                                return "iPhone XS"
        case .iPhone114, .iPhone116:                    return "iPhone XS Max"
        case .iPhone118:                                return "iPhone XR"
        case .iPhone121:                                return "iPhone 11"
        case .iPhone123:                                return "iPhone 11 Pro"
        case .iPhone125:                                return "iPhone 11 Pro Max"
        case .iPhone128:                                return "iPhone SE (2nd generation)"
        case .iPad21, .iPad22, .iPad23, .iPad24:        return "iPad 2"
        case .iPad31, .iPad32, .iPad33:                 return "iPad (3rd generation)"
        case .iPad34, .iPad35, .iPad36:                 return "iPad (4th generation)"
        case .iPad611, .iPad612:                        return "iPad (5th generation)"
        case .iPad75, .iPad76:                          return "iPad (6th generation)"
        case .iPad711, .iPad712:                        return "iPad (7th generation)"
        case .iPad41, .iPad42, .iPad43:                 return "iPad Air"
        case .iPad53, .iPad54:                          return "iPad Air 2"
        case .iPad114, .iPad115:                        return "iPad Air (3rd generation)"
        case .iPad25, .iPad26, .iPad27:                 return "iPad mini"
        case .iPad44, .iPad45, .iPad46:                 return "iPad mini 2"
        case .iPad47, .iPad48, .iPad49:                 return "iPad mini 3"
        case .iPad51, .iPad52:                          return "iPad mini 4"
        case .iPad111, .iPad112:                        return "iPad mini (5th generation)"
        case .iPad63, .iPad64:                          return "iPad Pro (9.7-inch)"
        case .iPad73, .iPad74:                          return "iPad Pro (10.5-inch)"
        case .iPad81, .iPad82, .iPad83, .iPad84:        return "iPad Pro (11-inch) (1st generation)"
        case .iPad89, .iPad810:                         return "iPad Pro (11-inch) (2nd generation)"
        case .iPad67, .iPad68:                          return "iPad Pro (12.9-inch) (1st generation)"
        case .iPad71, .iPad72:                          return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPad85, .iPad86, .iPad87, .iPad88:        return "iPad Pro (12.9-inch) (3rd generation)"
        case .iPad811, .iPad812:                        return "iPad Pro (12.9-inch) (4th generation)"
        case .appleTV53:                                return "Apple TV"
        case .appleTV62:                                return "Apple TV 4K"
        case .audioAccessory11:                         return "HomePod"
        case .i386, .x86_64:                            return "Simulator " + (ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS").iUIDevice.pretty
        default:                                        return "undefined"
        }
    }
}
internal extension String {
    var iUIDevice: IUIDevice {
        guard let deviceResponse = IUIDevice(rawValue: self) else { return .undefined }
        return deviceResponse
    }
}
