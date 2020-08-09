//
//  iExtend+String.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {
    func open() {
        guard let url = URL(string: self) else { return }
        openWith(url: url)
    }
    func MD5() -> String? {
        let length: Int = Int(CC_MD5_DIGEST_LENGTH)
        var digest: [UInt8] = [UInt8](repeating: 0, count: length)
        if let data = self.data(using: String.Encoding.utf8) {
            data.withUnsafeBytes( { (buffer: UnsafeRawBufferPointer) in
                guard let baseAddress = buffer.baseAddress else { return }
                CC_MD5(baseAddress, CC_LONG(buffer.count), &digest)
            })
        }
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
    func firstCapital() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    var isValidURL: Bool {
        guard !self.isEmpty else { return false }
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            guard let matchFrom = detector
                .firstMatch(in: self, options: [],
                            range: NSRange(location: 0,
                                           length: self.utf16.count)) else { return false}
            return matchFrom.range.length == self.utf16.count
        } catch {
            return false
        }
    }
    func proceedIfContains(_ matchCharacters: String) -> Bool {
        let characterSet: CharacterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }
    func proceedOnlyFor(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet: CharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    func proceedIfNotPresent(_ matchCharacters: String) -> Bool {
        let characterSet: CharacterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }
    func proceedIfNumbers() -> Bool {
        let disallowedCharacterSet: CharacterSet = CharacterSet(charactersIn: numbers).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    func proceedIfLetters() -> Bool {
        let disallowedCharacterSet: CharacterSet = CharacterSet(charactersIn: letters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    func isNumeric() -> Bool {
        let scanner: Scanner = Scanner(string: self)
        scanner.locale = Locale.current
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    func getDate(dateFormatter dateFormat: String) -> Date?{
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter.date(from: self)
    }
    func get24Hour() -> String {
        guard !self.isEmpty else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        if let givenDate = dateFormatter.date(from: self){
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: givenDate)
        } else {
            return ""
        }
    }
    func get12Hour() -> String {
        guard !self.isEmpty else { return "" }
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        if let givenDate = dateFormatter.date(from: self){
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: givenDate)
        } else {
            return ""
        }
    }
    func checkInValid() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    func trimString() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    func removeAllSpaces() -> String {
        return self.components(separatedBy: .whitespaces).joined()
    }
    func isValidEmailAddress() -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self.trimString())
    }
    var loginResponse: LoginResponseAction {
        guard let loginResponseCheck = LoginResponseAction(rawValue: self) else { return .error }
        return loginResponseCheck
    }
    var onBoardingResponse: OnboardingIndex {
        guard let onboardingResponseCheck = OnboardingIndex(rawValue: self) else { return .error }
        return onboardingResponseCheck
    }
    var iDevice: IDevice {
        guard let deviceResponse = IDevice(rawValue: self) else { return .undefined }
        return deviceResponse
    }
    var boolValue: Bool {
        return NSString(string: self.lowercased()).boolValue
    }
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    func toInt() -> Int? {
        guard let returnResponse = Int(self) else { return nil }
        return returnResponse
    }
    func toDouble() -> Double? {
        guard let returnResponse = Double(self) else { return nil }
        return returnResponse
    }
}
