//
//  EventTableViewCell.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    private struct Appearance {
        static let ratio: CGFloat = 343.0 / 213.0
    }


    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        // view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Gift")
        return imageView
    }()

    let offer1Label: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    let price1Label: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "priceColor")
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        updateConstraints()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(backView)
        contentView.addSubview(separatorView)
        contentView.addSubview(offer1Label)
        contentView.addSubview(price1Label)
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(iconImageView)
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.useAndActivate([

            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / Appearance.ratio),
            mainImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: offer1Label.topAnchor, constant: -12),

            subtitleLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -20),
            subtitleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),

            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),

            offer1Label.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -14),
            offer1Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            offer1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            offer1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            price1Label.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -14),
            price1Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            price1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            price1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            iconImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            iconImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 22),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func configureCell(_ config: EventModel) {
        titleLabel.text = config.title
        titleLabel.sizeToFit()
        subtitleLabel.text = config.subtitle
        subtitleLabel.sizeToFit()
        mainImageView.image = UIImage(named: config.imageName)
        offer1Label.text = config.date.dates
        price1Label.text = config.date.price
        price1Label.sizeToFit()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
}

