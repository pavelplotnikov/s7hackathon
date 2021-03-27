//
//  VIewController+Tickets.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit
import WebKit
import SafariServices

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tickets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicketItemCell", for: indexPath) as? TicketCollectionViewCell else {
            return UICollectionViewCell()
        }
        let promos = viewModel.tickets

        myCell.configureCell(promos[indexPath.row])
        return myCell

    }
}
