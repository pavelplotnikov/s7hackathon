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
    let image = UIImage()
    let text: String
    func getType() -> MainPageCellTypes {
        return .hotel
    }
}

struct CarModel: AbstractCell {
    let image = UIImage()
    let text: String
    func getType() -> MainPageCellTypes {
        return .car
    }
}

struct PromoModel: AbstractCell {
    let image = UIImage()
    let text: String
    func getType() -> MainPageCellTypes {
        return .promo
    }
}
