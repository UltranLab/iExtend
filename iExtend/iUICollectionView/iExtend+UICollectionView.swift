//
//  iExtend+UICollectionView.swift
//  iExtend
//
//  Created by ULTLab on 23/12/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func center(forSection section: Int) -> UIEdgeInsets {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
            let dataSourceCount = self.dataSource?.collectionView(self, numberOfItemsInSection: section),
            dataSourceCount > 0 else { return .zero }
        let cellCount = CGFloat(dataSourceCount)
        let itemSpacing = flowLayout.minimumInteritemSpacing
        let cellWidth = flowLayout.itemSize.width + itemSpacing
        var insets = flowLayout.sectionInset
        let totalCellWidth = (cellWidth * cellCount) - itemSpacing
        let contentWidth = self.frame.size.width - self.contentInset.left - self.contentInset.right
        guard totalCellWidth < contentWidth else { return insets }
        let padding = (contentWidth - totalCellWidth) / 2.0
        insets.left = padding
        insets.right = padding
        return insets
    }
    func getIndex(fromSender sender: UIButton) -> IndexPath? {
        guard let index = self.indexPathForItem(at: sender.convert(CGPoint.zero, to: self)) else { return nil }
        return index
    }
}
