//
//  iExtend+UIScrollView.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIScrollView {
    var isAlreadyBottom: Bool {
        return contentOffset.y >= verticalOffsetForBottom
    }
    var verticalOffsetForBottom: CGFloat {
        return ((contentSize.height) + (contentInset.bottom - bounds.height))
    }
}
