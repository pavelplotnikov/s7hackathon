//
//  MainPageViewModel.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation

import UIKit
import Foundation

class MainPageViewModel: ViewModelBase {
    private struct Appearance {
        static let getVzrTitleColor: UIColor = .black
    }

    var needs2update: Observable<Bool> = Observable<Bool>.init(false)

    var buttons: [MainPageButton] {
        var buttonList = [
            MainPageButton(
                type: .callEmergency,
                title: String.callEmergency,
                image: Appearance.callEmergency,
                textColor: Appearance.callEmergencyTitleColor,
                backgroundColor: Appearance.callEmergencyBackground,
                hasBorder: true),
            MainPageButton(
                type: .newAppointment,
                title: String.newAppointment,
                image: Appearance.newAppointment,
                textColor: Appearance.newAppointmentTitleColor,
                backgroundColor: Appearance.newAppointmentBackground,
                hasBorder: false),
            MainPageButton(
                type: .callDoctorAtHome,
                title: String.callDoctorAtHome,
                image: Appearance.callDoctorAtHome,
                textColor: Appearance.callDoctorAtHomeTitleColor,
                backgroundColor: Appearance.callDoctorAtHomeBackground,
                hasBorder: true),
            MainPageButton(
                type: .askDoctor,
                title: String.askDoctor,
                image: Appearance.askDoctor,
                textColor: Appearance.askDoctorTitleColor,
                backgroundColor: Appearance.askDoctorBackground,
                hasBorder: true)]

        if SingletonCache.shared.userInfo.value?.patient?.activeSlot?.programm?.vzrPurchasePolicy != .VZR_CANT_BUY {
            buttonList.append(MainPageButton(
                                type: .getVzr,
                                title: String.getVzr,
                                image: Appearance.getVzr,
                                textColor: Appearance.getVzrTitleColor,
                                backgroundColor: Appearance.getVzrBackground,
                                hasBorder: true))
        }
        return buttonList
    }

    private let analytics: AnalyticsServiceProtocol

    required init(coordinatorDelegate: MainPageCoordinatorInputProtocol?, apiClient: APIClient, analytics: AnalyticsServiceProtocol) {
        self.coordinatorDelegate = coordinatorDelegate
        self.apiClient = apiClient
        self.analytics = analytics
        super.init()
        analytics.trackScreenView("screen_main")
    }

    override func reloadData(source: LoadInitiator) {
        if source == LoadInitiator.viewWillAppear {
            self.myDataResponse = SingletonCache.shared.userInfo.value
            self.doRequests()
        } else {
            let requestMyData = MyDataRequest()
            do {
                try apiClient.send(requestMyData) { [weak self] result in
                    guard let self = self else {return}
                    switch result {
                    case .success(let data):
                        SingletonCache.shared.userInfo.value = data.data
                        self.myDataResponse = data.data
                        self.doRequests()
                    case .failure(let error):
                        Log.write(message: "get my data error: \(error.localizedDescription)", subsystem: .chat, level: .error)
                    }
                    Log.write(message: "my data was received: \(result)", subsystem: .chat, level: .info)
                }
            } catch let error {
                Log.write(message: "get my data error: \(error.localizedDescription)", subsystem: .chat, level: .error)
            }
        }
    }


    func selectButton(index: Int) {
        guard index >= 0 && index < buttons.count else { return }
        let button = buttons[index]
        switch button.type {
        case .askDoctor:
            openChat()
        case .callEmergency:
            callEmergency()
        case .newAppointment:
            openNewAppointment()
        case .callDoctorAtHome:
            openDoctorAtHome()
        case .getVzr:
            openGetVzr()
        }
    }

    func openSafari(with url: URL) {
        analytics.track("action_main_promo_opened_external_url", properties: nil)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }


}

enum MainPageCellTypes: String {
    case hotel()
    case car
    case promo
}
