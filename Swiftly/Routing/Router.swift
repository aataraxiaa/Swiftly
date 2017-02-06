//
//  Router.swift
//  Swiftly
//
//  Created by Pete Smith on 06/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit

struct Router {
    
    static var rootViewController: UISplitViewController = {
        let splitViewController = UISplitViewController()
        
        // Configure master & detail view controllers
        splitViewController.viewControllers = [Router.tabBarController,
                                                 Router.detailNavigationViewController]
        
        return splitViewController
    }()
    
    fileprivate static var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        
        // Configure the tab view controllers
        tabBarController.viewControllers = [Router.masterNavigationViewController]
        
        return tabBarController
    }()
    
    fileprivate static var masterNavigationViewController: UINavigationController = {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        
        return navigationController
    }()
    
    fileprivate static var detailNavigationViewController: UINavigationController = {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        
        return navigationController
    }()
}

private typealias PrivateAPI = Router
fileprivate extension PrivateAPI {
    
}
