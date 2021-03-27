//
//  AppDelegate.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: ViewController(MainPageViewModel()))
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
        return true
    }
}

