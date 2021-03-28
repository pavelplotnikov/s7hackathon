//
//  MainPageViewModel.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit
import Foundation

class MainPageViewModel: ViewModelBase {
    var needs2update: Observable<Bool> = Observable<Bool>.init(false)
    var rows: [AbstractCell] {
        let rows: [AbstractCell] = [
            HotelModel(imageName: "hotel", title: "Отель “Omg Dude!”", subtitle: "Благородный и недорогой отель для тех, кто хочет полюбить Москву всем сердцем. Дешевое бронирование на лето.", offers: [
                        HotelModel.HotelOffer(dates: "3 апреля - 12 апреля (9 ночей)", price: "24 500 ₽"),
                        HotelModel.HotelOffer(dates: "7 апреля - 11 апреля (4 ночей)", price: "13 550 ₽")]),
            ArticleModel(imageName: "ostrov", title: "Островная жизнь Москвы", subtitle: "Идеальный маршрут для тех, кто хочет больше узнать про искусственный остров в центре Москвы."),
            InfoModel(imageName: "sights", title: "Топ-10 мест в центре Москвы", subtitle: "Которые стоит посетить, чтобы проникнуться атмосферой не только современной Москвы, но и Москвы старинной, дореволюционной, а то и вовсе окунуться в самое средневековье."),
            EventModel(imageName: "event", title: "Moscow Travel Hack", subtitle: "Moscow Travel Hack — это второй масштабный хакатон по теме цифровизации индустрии туризма города Москвы. Десять задач, шестьдясят команд, тридцать часов непрерывного кодинга.", date: EventModel.EventOffer(dates: "27 марта - 29 марта (3 дня)", price: "22 576 ₽")),
            TrainModel(imageName: "aeroexpress", title: "Вы точно не опоздаете", subtitle: "Вы прилетаете в аэропорт Домодедово. Чтобы добраться до города, советуем быстрый поезд – аэроэкспресс, который доставит вас прямо в центр Москвы.", offers: [
                        TrainModel.TrainOffer(dates: "Домодедово - Москва", price: "400 ₽"),
                        TrainModel.TrainOffer(dates: "Домодедово - Москва (туда-обратно)", price: "750 ₽")]),
            InfoModel(imageName: "art", title: "Арт-Москва", subtitle: "Поход в музей или в галерею — неотъемлемый пункт программы каждого туриста. Мы выбрали самые интересные места, в которых можно увидеть работы современных российских художников или европейских классиков."),
            ArticleModel(imageName: "corona", title: "Коронавирус – как быть?", subtitle: "Рассказываем, что делать, если коронавирус меняет ваши планы: мы собрали всю актуальную информацию об ограничениях на въезд, отмене рейсов и рекомендациях по безопасности."),
        ]
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
    case article
    case info
    case event
    case train
}
