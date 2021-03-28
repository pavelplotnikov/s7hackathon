//
//  MainFooterView.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 28.03.2021.
//

import Foundation
import UIKit

class MainFooterView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        ¯\\_(ツ)_/¯

        Вы посмотрели все свежие новости.
        """
        label.sizeToFit()
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubviews()
        createLayout()
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func createLayout() {
        NSLayoutConstraint.useAndActivate([
            titleLabel.widthAnchor.constraint(equalToConstant: 158),
            titleLabel.heightAnchor.constraint(equalToConstant: 64),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -72)
        ])
    }

    func configure() {
    }
}
