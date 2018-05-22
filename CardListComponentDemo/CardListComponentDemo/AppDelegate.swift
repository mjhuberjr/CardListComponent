//
//  AppDelegate.swift
//  CardListComponentDemo
//
//  Created by Michael J. Huber Jr. on 5/21/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import CardListComponent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let rootCoordinator = CardListComponentCoordinator(dataSource: nil)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator.cardListComponentViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

