//
//  ViewModelBase.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation
import Combine

enum LoadInitiator {
    case pullToRefresh
    case viewWillAppear
    case externalReload
}
protocol ViewModelProtocolBase: AnyObject {
    var shouldShowSpinner: Observable<Bool> {get}
    func showSpinner()
    func hideSpinner()
    func reloadData(source: LoadInitiator)
}

class ViewModelBase: ViewModelProtocolBase {
    var shouldShowSpinner = Observable<Bool>(false)

    func showSpinner() {
        shouldShowSpinner.value = true
    }

    func hideSpinner() {
        shouldShowSpinner.value = false
    }

    func reloadData(source: LoadInitiator) {

    }
}
