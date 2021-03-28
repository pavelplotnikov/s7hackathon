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

struct TrainModel: AbstractCell {
    let imageName: String
    let title: String
    let subtitle: String
    let offers: [TrainOffer]

    func getType() -> MainPageCellTypes {
        return .train
    }

    struct TrainOffer {
        let dates: String
        let price: String
    }
}

struct EventModel: AbstractCell {
    let imageName: String
    let title: String
    let subtitle: String
    let date: EventOffer

    func getType() -> MainPageCellTypes {
        return .event
    }

    struct EventOffer {
        let dates: String
        let price: String
    }
}

struct ArticleModel: AbstractCell {
    let imageName: String
    let title: String
    let subtitle: String
    func getType() -> MainPageCellTypes {
        return .article
    }
}

struct InfoModel: AbstractCell {
    let imageName: String
    let title: String
    let subtitle: String
    func getType() -> MainPageCellTypes {
        return .info
    }
}
