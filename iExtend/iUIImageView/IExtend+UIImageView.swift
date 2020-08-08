//
//  IExtend+UIImageView.swift
//  iExtend
//
//  Created by ULTLab on 06/05/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIImageView {
    func fadeImageChange(withImage image: UIImage, duration value: Double = 0.5) {
        UIView.transition(with: self,
                          duration: value,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.image = image
        }, completion: nil)
    }
}
