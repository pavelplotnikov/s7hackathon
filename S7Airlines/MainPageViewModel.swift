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
            HotelModel(imageName: "hotel", title: "Отель “Omg Dude!”", subtitle: "Благородный и недорогой отель для тех, кто хочет полюбить Москву всем сердцем. Дешевое бронирование на лето.", offers: [
                        HotelModel.HotelOffer(dates: "3 апреля - 12 апреля (9 ночей)", price: "24 500 ₽"),
                        HotelModel.HotelOffer(dates: "7 апреля - 11 апреля (4 ночей)", price: "13 550 ₽")]),
            //CarModel(imageName: "sights", text: "Машина"),
            PromoModel(imageName: "ticket", text: "Промо")]
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
