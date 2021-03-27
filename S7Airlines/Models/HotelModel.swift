//
//  HotelModel.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import UIKit

protocol AbstractCell {
    func getType() -> MainPageCellTypes
}

struct HotelModel: AbstractCell {
    let imageName: String
    let title: String
    let subtitle: String
    let offers: [HotelOffer]

    func getType() -> MainPageCellTypes {
        return .hotel
    }

    struct HotelOffer {
        let dates: String
        let price: String
    }
}

struct CarModel: AbstractCell {
    let imageName: String
    let text: String
    let offers: [CarOffer]

    func getType() -> MainPageCellTypes {
        return .car
    }

    struct CarOffer {
        let dates: String
        let price: String
    }
}

struct PromoModel: AbstractCell {
    let imageName: String
    let text: String
    func getType() -> MainPageCellTypes {
        return .promo
    }
}
