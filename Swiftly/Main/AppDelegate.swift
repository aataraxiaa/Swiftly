//
//  AppDelegate.swift
//  Swiftly
//
//  Created by Pete Smith on 04/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import Firebase
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase
        FIRApp.configure()

        // Fabric
        Fabric.with([Crashlytics.self])
        
        // Configure our root view
        configureRootViewController()
        
        return true
    }
}

private typealias PrivateAPI = AppDelegate
fileprivate extension PrivateAPI {
    
    fileprivate func configureRootViewController() {
        window = UIWindow()
        window?.rootViewController = Router.rootViewController
        window?.makeKeyAndVisible()
    }
}

