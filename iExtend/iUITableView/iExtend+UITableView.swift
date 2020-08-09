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
        guard let index = self.indexPathForRow(at: sender.convert(CGPoint.zero, to: self)) else { return nil }
        return index
    }
    func isLastCell(forIndexPath index: IndexPath) -> Bool {
        guard let isLastCellIndex = self.indexPathsForVisibleRows?.last else { return false }
        return isLastCellIndex == index
    }
    func scrollToLastCell(animated: Bool = true) {
        let lastSectionIndex = self.numberOfSections - 1 // last section
        let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1 // last row
        self.scrollToRow(at: IndexPath(row: lastRowIndex, section: lastSectionIndex), at: .bottom, animated: animated)
    }
}
