//
//  DefaultSpinnerView.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit

class DefaultSpinnerView: UIView, Spinnable {
    private let spinner = UIActivityIndicatorView.init(style: .large)

    override func draw(_ rect: CGRect) {
        self.backgroundColor = .gray
        spinner.center = self.center
        self.addSubview(spinner)
    }

    func startAnimating() {
        spinner.startAnimating()
    }

    func stopAnimating() {
        spinner.stopAnimating()
    }
}

protocol Spinnable: UIView {
    func startAnimating()
    func stopAnimating()
}
