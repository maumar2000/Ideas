//
//  UIFont+Utility.swift
//  Ideas
//
//  Created by Mauricio Martinez on 24/8/23.
//

import Foundation
import UIKit

enum Lato: String {
    case regular = "Lato-Regular"
    case bold = "Lato-Bold"
}

extension UIFont {
    convenience init?(_ size: Int, _ family: Lato) {
        self.init(name: family.rawValue, size: CGFloat(size))
    }
}
