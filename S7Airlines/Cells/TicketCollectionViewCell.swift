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
    }

    let backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Appearance.cornerRadius
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "priceLight")
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .white
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
        backView.addSubview(imageView)
        backView.addSubview(titleLabel)
        backView.addSubview(timeLabel)
        backView.addSubview(textLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.useAndActivate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: backView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),

            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),

           // timeLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            timeLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            timeLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),

            textLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 0),
            textLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            textLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),
            textLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8)
        ])
    }

    func configureCell(_ config: TicketModel) {
        titleLabel.text = config.title
        titleLabel.sizeToFit()
        textLabel.text = config.text
        textLabel.sizeToFit()
        timeLabel.text = config.time
        timeLabel.sizeToFit()
        imageView.image = UIImage(named: config.imageName)

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.attributedText = nil
        imageView.image = nil
        accessibilityIdentifier = nil
    }
}

struct TicketModel {
    let title: String
    let time: String
    let text: String
    let imageName: String
}

