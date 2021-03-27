//
//  MainPageViewModel.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit
import Foundation

class MainPageViewModel: ViewModelBase {
    private struct Appearance {
        static let getVzrTitleColor: UIColor = .black
    }

    var needs2update: Observable<Bool> = Observable<Bool>.init(false)

    var rows: [AbstractCell] {
        let rows: [AbstractCell] = [
            HotelModel(text: "Отель"),
            CarModel(text: "Машина"),
            PromoModel(text: "Промо")]
        return rows
    }
    var tickets: [TicketModel] = [TicketModel(text: "blabla")]

    required override init() {
        super.init()
    }

    override func reloadData(source: LoadInitiator) {
    }

    func selectButton(index: Int) {
    }

    func openSafari(with url: URL) {
    }
}

enum MainPageCellTypes: String {
    case hotel
    case car
    case promo
}
