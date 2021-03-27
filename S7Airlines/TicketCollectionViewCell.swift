//
//  TicketCollectionViewCell.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit

class TicketCollectionViewCell: UICollectionViewCell {

    private struct Appearance {
        static let cornerRadius: CGFloat = 12
        static let textInsets: UIEdgeInsets = UIEdgeInsets(top: 24, left: 12, bottom: 10, right: 42)
        static let imageSize: CGSize = CGSize(width: 32, height: 32)
        static let topInset: CGFloat = 8
        static let rightInset: CGFloat = 8
    }

    let backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Appearance.cornerRadius
        view.backgroundColor = .green
        return view
    }()

    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        self.backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(backView)
        backView.addSubview(textLabel)
        backView.addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.useAndActivate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            textLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -Appearance.textInsets.bottom),
            textLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -Appearance.textInsets.right),
            textLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Appearance.textInsets.left),

            imageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: Appearance.topInset),
            imageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -Appearance.rightInset),
            imageView.widthAnchor.constraint(equalToConstant: Appearance.imageSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Appearance.imageSize.height)
        ])
    }

    func configureCell(_ config: TicketModel) {
        textLabel.text = config.text
        textLabel.sizeToFit()

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.attributedText = nil
        imageView.image = nil
        accessibilityIdentifier = nil
    }
}

struct TicketModel {
    let text: String
}

