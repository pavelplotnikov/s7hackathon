//
//  ViewController.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit

class ViewController: ViewControllerBase<MainPageViewModel> {

    struct Appearance {
        static let promoCellSize: CGSize = CGSize(width: 144, height: 70)
        static let interitemSpacing: CGFloat = 8
    }

    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var promoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 8,
            bottom: 0,
            right: 8)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .yellow
        edgesForExtendedLayout = []
        view.addSubview(tableView)
        setupTableView()
        createLayout()
        setupCollectionView()
        setupBindings()
    }

    func setupCollectionView() {
        promoCollectionView.register(TicketCollectionViewCell.self, forCellWithReuseIdentifier: "TicketItemCell")
        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
    }

    private func setupBindings() {
        viewModel.needs2update.observe(self, closure: { _ in
            self.tableView.reloadData()
        }, onMainThread: true)
    }

    private func createLayout() {
        NSLayoutConstraint.useAndActivate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(HotelTableViewCell.self, forCellReuseIdentifier: "hotelCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType = viewModel.rows[indexPath.row].getType()
        switch rowType {
        case .hotel: // Hotel
            viewModel.selectButton(index: indexPath.row)
//        case .car: //
//            viewModel.selectButton(index: indexPath.row)
        default:
            break
        }
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = viewModel.rows[indexPath.row].getType()
        switch rowType {
        case .hotel:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as? HotelTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(viewModel.rows[indexPath.row] as! HotelModel)
            return cell
        default:
            return UITableViewCell()
        }
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
