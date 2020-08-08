//
//  iExtend+UIImage.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIImage {
    func compressImageForUpload(compressionQuality value: CGFloat, onCompletion: ((_ finished: Bool, _ mainData: Data?) -> Void)? = nil){
        DispatchQueue.global(qos: .background).async {
            let currentImage: UIImage = self
            var sourceHeight: CGFloat = currentImage.size.height
            var sourceWidth: CGFloat = currentImage.size.width
            let maximumHeight: CGFloat = 1200.0
            let maximumWidth: CGFloat = 640.0
            var imageRatioToApply: CGFloat = sourceWidth/sourceHeight
            let maximumRatioCanApply: CGFloat = maximumWidth/maximumHeight
            var quality: CGFloat = value
            if (sourceHeight > maximumHeight) || (sourceWidth > maximumWidth){
                if (imageRatioToApply < maximumRatioCanApply){
                    imageRatioToApply = maximumHeight / sourceHeight
                    sourceWidth = imageRatioToApply * sourceWidth
                    sourceHeight = maximumHeight
                } else if (imageRatioToApply > maximumRatioCanApply) {
                    imageRatioToApply = maximumWidth / sourceWidth
                    sourceHeight = imageRatioToApply * sourceHeight
                    sourceWidth = maximumWidth
                } else {
                    sourceHeight = maximumHeight
                    sourceWidth = maximumWidth
                    quality = 1
                }
            }
            let shapeRect = CGRect(x: 0.0, y: 0.0, width: sourceWidth, height: sourceHeight)
            UIGraphicsBeginImageContext(shapeRect.size)
            currentImage.draw(in: shapeRect)
            let imageContext = UIGraphicsGetImageFromCurrentImageContext()
            guard let currentImageContextCheck = imageContext else {
                DispatchQueue.main.async { onCompletion?(false, nil) }
                return
            }
            let rawImageData = currentImageContextCheck.jpegData(compressionQuality: quality)
            UIGraphicsEndImageContext()
            guard let finalImageDataCheck = rawImageData else {
                DispatchQueue.main.async { onCompletion?(false, nil) }
                return
            }
            DispatchQueue.main.async { onCompletion?(true, finalImageDataCheck) }
        }
    }
}
