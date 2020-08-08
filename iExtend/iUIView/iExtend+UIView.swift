//
//  iExtend+UIView.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

@IBDesignable public extension UIView{
    func removeAnimation(forKey key: String = "") {
        if !key.isEmpty {
            self.layer.removeAnimation(forKey: key)
        } else {
            self.layer.removeAllAnimations()
        }
    }
    func heartBeat(forKey key: String, withDuration duration: TimeInterval = 1.0, from fromVal: Double = 1.0, to toVal: Double = 0.5) {
        guard !key.isEmpty else { return }
        let heartPulse: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        heartPulse.duration = duration
        heartPulse.repeatCount = HUGE
        heartPulse.autoreverses = true
        heartPulse.fromValue = NSNumber(floatLiteral: fromVal)
        heartPulse.toValue = NSNumber(floatLiteral: toVal)
        heartPulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.layer.add(heartPulse, forKey: key)
    }
    func rotate(withValue valueOfRotation: CGFloat = .pi, withDuration animationDuration: TimeInterval = 0.2) {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.toValue = valueOfRotation
        rotation.duration = animationDuration
        rotation.isRemovedOnCompletion = false
        rotation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(rotation, forKey: nil)
    }
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set (newShadow) {
            if newShadow {
                self.addShadow()
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set (newRadious) {
            self.layer.cornerRadius = newRadious
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    func addShadow(shadowColor color: CGColor = UIColor.black.cgColor,
                   shadowOffset offset: CGSize = CGSize(width: -1.0, height: -1.0),
                   shadowOpacity opacity: Float = 0.5,
                   shadowRadius radius: CGFloat = 3.0,
                   isScale scale: Bool = true,
                   cornerRadius corner: CGFloat = 0) {
        if corner > 0{
            self.layer.cornerRadius = corner
            self.layer.masksToBounds = false
        }
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color
        if corner > 0 {
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: corner, height: corner)).cgPath
        } else {
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        }
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func pushAnimation(withSubType type: CATransitionSubtype = CATransitionSubtype.fromTop, withDuration time: CFTimeInterval = 0.4) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = type   //(type == .fromTop) ? type : (type == .)   CATransitionSubtype.fromBottom//fromTop
        animation.duration = time
        self.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
    func makeRoundShape() {
        guard self.frame.size.height == self.frame.size.width else {
            debugPrint("This view can't be round shaped because height and width are not same!")
            return
        }
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    func smoothRoundCorners(toRadius radius: CGFloat) {
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        self.layer.mask = maskLayer
    }
    func applyBorder(borderWidth width: CGFloat, borderColor color: UIColor, lowerBorder lower: Bool = false) {
        guard width > 0 else {
            debugPrint("Please provide an width greater than 0 to show on the design.")
            return
        }
        switch lower {
        case true:
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            let borderView: UIView = UIView()
            borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            borderView.frame = CGRect(x: self.frame.origin.x, y: ((self.frame.origin.y + self.frame.height) - width), width: self.frame.width, height: width)
            borderView.backgroundColor = color
            self.superview?.insertSubview(borderView, aboveSubview: self)
        default:
            self.layer.borderWidth = width
            self.layer.borderColor = color.cgColor
        }
    }
    func changeHalfCorner(side whichSide: HalfCornerSide,
                          addBorder border: Bool = false,
                          borderColor color: UIColor = .clear,
                          width borderWidth: CGFloat = 1) {
        let cornerShape: CAShapeLayer = CAShapeLayer()
        cornerShape.bounds = self.frame
        cornerShape.position = self.center
        cornerShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: (whichSide == .left) ? [.bottomLeft, .topLeft] : [.bottomRight, .topRight], cornerRadii: CGSize(width: self.frame.size.height, height: self.frame.size.height)).cgPath
        self.layer.backgroundColor = (self.backgroundColor != nil) ? self.backgroundColor!.cgColor : UIColor.clear.cgColor
        self.layer.mask = cornerShape
        switch border {
        case true, color != .clear, borderWidth > 0:
            let borderLayer: CAShapeLayer = CAShapeLayer()
            borderLayer.path = cornerShape.path
            borderLayer.position = cornerShape.position
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeColor = color.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.frame = self.bounds
            self.layer.addSublayer(borderLayer)
        default:
            break
        }
    }
    func shake(withRepeat repeatCount: Float = 5,
               withDuration duration: TimeInterval = 0.05,
               reverse auto: Bool = true) {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = duration
        shakeAnimation.repeatCount = repeatCount
        shakeAnimation.autoreverses = auto
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        self.layer.add(shakeAnimation, forKey: "position")
    }
    func customRoundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath: UIBezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    func makeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
