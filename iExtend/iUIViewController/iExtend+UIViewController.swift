//
//  iExtend+UIViewController.swift
//  iExtend
//
//  Created by ULTLab on 22/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit

public extension UIViewController {
    func setStatusBar(withColor color: UIColor = .white) {
        var statusView: UIView!
        if #available(iOS 13.0, *) {
            if let statusFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame {
                statusView = UIView(frame: statusFrame)
            } else {
                statusView = UIView(frame: UIApplication.shared.statusBarFrame)
            }
        } else {
            if let statusViewC = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView {
                statusView = statusViewC
            } else {
                statusView = UIView(frame: UIApplication.shared.statusBarFrame)
            }
        }
        statusView.backgroundColor = color
        Thread.onMainThread { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(statusView)
            statusView.translatesAutoresizingMaskIntoConstraints = false
            statusView.heightAnchor
                .constraint(equalToConstant: statusView.frame.size.height).isActive = true
            statusView.widthAnchor
                .constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
            statusView.topAnchor
                .constraint(equalTo: self.view.topAnchor).isActive = true
            statusView.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.view.sendSubviewToBack(statusView)
            self.view.layoutIfNeeded()
        }
    }
    func presentBasicSafariView(for url: String) {
        guard let finalUrl = URL(string: url) else { return }
        presentBasicSafariView(for: finalUrl)
    }
    func presentBasicSafariView(for url: URL) {
        guard SPFunctions.status(of: url) else { return }
        guard (self.presentedViewController == nil) else {
            SPLogEngine.debugLog(for: "Failed to load SafariView for url - \(url.absoluteString) as some other goddamn SafariView is already present on the screen!")
            return
        }
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
