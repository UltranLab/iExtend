//
//  iExtend+UIViewController.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit
import SafariServices

public extension UIViewController {
    func setStatusBar(withColor color: UIColor = .white) {
        var statusView: UIView?
        if #available(iOS 13.0, *) {
            if let statusFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame {
                statusView = UIView(frame: statusFrame)
            }
        } else {
            if let statusViewC = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView {
                statusView = statusViewC
            } else {
                statusView = UIView(frame: UIApplication.shared.statusBarFrame)
            }
        }
        guard let status = statusView else { return }
        status.backgroundColor = color
        Thread.onMainThread { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(status)
            status.translatesAutoresizingMaskIntoConstraints = false
            status.heightAnchor
                .constraint(equalToConstant: status.frame.size.height).isActive = true
            status.widthAnchor
                .constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
            status.topAnchor
                .constraint(equalTo: self.view.topAnchor).isActive = true
            status.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.view.sendSubviewToBack(status)
            self.view.layoutIfNeeded()
        }
    }
    func presentBasicSafariView(for url: String) {
        guard let finalUrl = URL(string: url) else { return }
        presentBasicSafariView(for: finalUrl)
    }
    func presentBasicSafariView(for url: URL) {
        guard url.status(), (self.presentedViewController == nil) else { return }
        let safariView: SFSafariViewController = SFSafariViewController(url: url)
        Thread.onMainThread { [weak self] in
            guard let self = self else { return }
            self.present(safariView, animated: true)
        }
    }
    func showAlert(withTitle title: String, message msg: String,
                   ok okTitle: String? = nil, cancel cancelTitle: String? = nil,
                   onCompletion: ((_ finished: Bool) -> Void)? = nil) {
        let alertController: UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        if let ok = okTitle, !ok.isEmpty {
            let okAction: UIAlertAction = UIAlertAction(title: ok, style: .default) { (action) in
                Thread.onMainThread {
                    onCompletion?(false)
                    alertController.dismiss(animated: true)
                }
            }
            alertController.addAction(okAction)
        }
        if let cancel = cancelTitle, !cancel.isEmpty {
            let cancelAction: UIAlertAction = UIAlertAction(title: cancel, style: .default) { (finished) in
                Thread.onMainThread {
                    onCompletion?(false)
                    alertController.dismiss(animated: true)
                }
            }
            alertController.addAction(cancelAction)
        }
        guard self.presentedViewController == nil else { return }
        Thread.onMainThread { [weak self] in
            guard let self = self else { return }
            self.present(alertController, animated: true)
        }
    }    
}
