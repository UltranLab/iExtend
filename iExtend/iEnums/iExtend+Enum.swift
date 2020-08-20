//
//  iExtend+Enum.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public enum LoginResponseAction: String {
    case goHome, error, signUp, forgotPassword
}

public enum UserState: String {
    case loggedIn, free, premium
}

public enum OnboardingIndex: String {
    case backward, forward, skip, error, conti
}

public enum IStatus: String {
    case error, empty, apiEmpty, authEmpty, systemError
    case success, noInternet, invalidRequest, cancelled
    case invalidJSONFile, invalidJSONResponse, undefined
}

public enum IUICornerDirection: String {
    case left, right, bottom, top, all, undefined
}
