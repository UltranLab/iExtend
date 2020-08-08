//
//  iExtend+Thread.swift
//  iExtend
//
//  Created by ULTLab on 08/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Thread {
    class func onMainThread(_ onCompletion: @escaping (()-> Void)) {
        guard !Thread.current.isMainThread else { return onCompletion() }
        DispatchQueue.main.async { onCompletion() }
    }
}
