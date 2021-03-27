//
//  HotelTableViewCell.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    private struct Appearance {
        static let inset: CGFloat = 4
        static let lineSpacing: CGFloat = 3.0
        static let imageWidth: CGFloat = 40
        static let imageHeight: CGFloat = 40

        static let lockImageWidth: CGFloat = 16
        static let lockImageHeight: CGFloat = 16
        static let lockImageRight: CGFloat = 2

        static let additionalOffset: CGFloat = 4

        static let ratio: CGFloat = 343.0 / 213.0
    }


    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.05)
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
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
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

    let offer2Label: UILabel = {
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

    let price2Label: UILabel = {
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
        contentView.addSubview(offer2Label)
        contentView.addSubview(price1Label)
        contentView.addSubview(price2Label)
        contentView.addSubview(separatorView)
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.useAndActivate([

            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),


            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            // mainImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / Appearance.ratio),
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainImageView.bottomAnchor.constraint(equalTo: offer1Label.topAnchor, constant: -12),

            subtitleLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -20),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            offer1Label.bottomAnchor.constraint(equalTo: offer2Label.topAnchor, constant: -20),
            offer1Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            offer1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            offer2Label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            offer2Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            offer2Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            price1Label.bottomAnchor.constraint(equalTo: offer2Label.topAnchor, constant: -20),
            price1Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            price1Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            price2Label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            price2Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            price2Label.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            separatorView.topAnchor.constraint(equalTo: offer1Label.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            separatorView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func configureCell(_ config: HotelModel) {
        titleLabel.text = config.title
        titleLabel.sizeToFit()
        subtitleLabel.text = config.subtitle
        subtitleLabel.sizeToFit()
        mainImageView.image = UIImage(named: config.imageName)
        offer1Label.text = config.offers[0].dates
        offer1Label.sizeToFit()
        offer2Label.text = config.offers[1].dates
        offer2Label.sizeToFit()
        price1Label.text = config.offers[0].price
        price1Label.sizeToFit()
        price2Label.text = config.offers[1].price
        price2Label.sizeToFit()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
}
