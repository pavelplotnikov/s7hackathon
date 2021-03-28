//
//  MainBarView.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 28.03.2021.
//

import Foundation
import UIKit

class MainBarView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Александра"
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "secondaryText")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2308 миль"
        return label
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var hamburgerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Burger"), for: .normal)
        return button
    }()

    private lazy var avaButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ava"), for: .normal)
        return button
    }()

    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notification"), for: .normal)
        return button
    }()

    private lazy var chatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chat"), for: .normal)
        return button
    }()

    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "indicator")
        return imageView
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
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(hamburgerButton)
        addSubview(avaButton)
        addSubview(separatorView)
        addSubview(notificationButton)
        addSubview(chatButton)
        addSubview(badgeImageView)
        addSubview(chatButton)
        addSubview(badgeImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }

    private func createLayout() {
        NSLayoutConstraint.useAndActivate([
            heightAnchor.constraint(equalToConstant: 104),
            hamburgerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hamburgerButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 24),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 24),
            avaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avaButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            avaButton.heightAnchor.constraint(equalToConstant: 44),
            avaButton.widthAnchor.constraint(equalToConstant: 44),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),

            badgeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            badgeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            badgeImageView.heightAnchor.constraint(equalToConstant: 16),
            badgeImageView.widthAnchor.constraint(equalToConstant: 23),

            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            notificationButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            notificationButton.heightAnchor.constraint(equalToConstant: 32),
            notificationButton.widthAnchor.constraint(equalToConstant: 32),

            chatButton.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -8),
            chatButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            chatButton.heightAnchor.constraint(equalToConstant: 32),
            chatButton.widthAnchor.constraint(equalToConstant: 32),

            titleLabel.leadingAnchor.constraint(equalTo: avaButton.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            subtitleLabel.leadingAnchor.constraint(equalTo: avaButton.trailingAnchor, constant: 12),
            subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),

            avaButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            avaButton.heightAnchor.constraint(equalToConstant: 44),
            avaButton.widthAnchor.constraint(equalToConstant: 44),
        ])
    }

    func configure() {
    }
}
