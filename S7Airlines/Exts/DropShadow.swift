//
//  DropShadow.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 25
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
