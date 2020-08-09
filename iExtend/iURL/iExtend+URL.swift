//
//  iExtend+URL.swift
//  iExtend
//
//  Created by ULTLab on 09/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension URL {
    func status() -> Bool {
        guard !self.absoluteString.isEmpty else { return false }
        return UIApplication.shared.canOpenURL(self)
    }
    func open() {
        guard self.status() else { return }
        Thread.onMainThread { [weak self] in
            guard let self = self else { return }
            if #available(iOS 10, *) {
                UIApplication.shared.open(self)
            } else {
                UIApplication.shared.openURL(self)
            }
        }
    }
}
