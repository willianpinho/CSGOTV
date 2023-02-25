//
//  AppDelegate.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window!)
        appCoordinator.start()
        return true
    }
}
