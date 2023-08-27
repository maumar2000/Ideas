//
//  UIViewController+Alerts.swift
//  Ideas
//
//  Created by Mauricio Martinez on 24/8/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertWith(titleText: String, messageText: String, buttonText: String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default))
        self.present(alert, animated: true)
    }
}
