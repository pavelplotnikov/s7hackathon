//
//  CaruselTableViewCell.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 28.03.2021.
//

import Foundation
import UIKit

class CaruselTableViewCell: UITableViewCell {

    var tickets: [TicketModel]?

    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    lazy var promoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0)
        layout.itemSize = CGSize(width: 90, height: 120)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.text = "Мои билеты"
        label.sizeToFit()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        updateConstraints()
        setupCollectionView()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCollectionView() {
        promoCollectionView.register(TicketCollectionViewCell.self, forCellWithReuseIdentifier: "TicketItemCell")
        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
    }

    func setupViews() {
        contentView.addSubview(backView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(promoCollectionView)
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.useAndActivate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            backView.heightAnchor.constraint(equalToConstant: 175),

            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),

            promoCollectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            promoCollectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            promoCollectionView.heightAnchor.constraint(equalToConstant: 123),
            promoCollectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
        ])
    }

    func configureCell(_ config: CaruselModel) {
        tickets = config.tickets
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
}



