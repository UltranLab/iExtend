//
//  iExtend+UITableView.swift
//  iExtend
//
//  Created by ULTLab on 23/12/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UITableView {
    func nextResponder(currentIndex index: Int, totalIndex ttlIndex: Int, currentSection section: Int = 0) {
        for finalIndex in (index + 1)..<ttlIndex {
            if let view = self.superview?.superview?.viewWithTag(finalIndex) {
                view.becomeFirstResponder()
                let index = IndexPath(row: finalIndex - ttlIndex, section: section)
                if let nextCell = self.cellForRow(at: index) {
                    self.scrollRectToVisible(nextCell.frame, animated: true)
                }
                break
            }
        }
    }
    func getIndex(fromSender sender: UIButton) -> IndexPath? {
        let table: UITableView = self
        let position: CGPoint = sender.convert(CGPoint.zero, to: table)
        guard let index = table.indexPathForRow(at: position) else { return nil }
        return index
    }
}
