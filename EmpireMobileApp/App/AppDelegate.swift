//
//  AppDelegate.swift
//  EmpireMobileApp
//
//  Created by Rodrigo Nunes on 10/12/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tripCoordinator = TripCoordinator()
        let rootVc = tripCoordinator.createTripList()
        window?.rootViewController = UINavigationController(rootViewController: rootVc)
        window?.makeKeyAndVisible()
        return true
    }
}

