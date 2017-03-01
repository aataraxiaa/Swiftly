//
//  Router.swift
//  Swiftly
//
//  Created by Pete Smith on 06/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import SwiftEvolutionProvider
import SafariServices

struct Router {
    
    // MARK: - Properities (Public)
    
    static var rootViewController: UISplitViewController = {
        let splitViewController = UISplitViewController()
        
        // Configure master & detail view controllers
        splitViewController.viewControllers = [Router.tabBarController,
                                                 Router.detailNavigationViewController]
        
        return splitViewController
    }()
    
    // MARK: - Properities (Private)
}

private typealias PrivateAPI = Router
fileprivate extension PrivateAPI {
    
    fileprivate static var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        
        // Configure the tab view controllers
        tabBarController.viewControllers = [Router.masterNavigationViewController]
        
        return tabBarController
    }()
    
    fileprivate static var masterNavigationViewController: UINavigationController = {
        
        // Set initial root view controller
        let masterRootViewController = CollectionViewController<ProposalCell>(withAdapter: ProposalAdapter(), andNavigationAction: { element in
        
            if let proposal = element as? Proposal {
                guard let url = URL(
                    string: "https://github.com/apple/swift-evolution/blob/master/proposals/"+proposal.link) else { return }
                
                let safariViewController = SFSafariViewController(url: url)
                
//                detailNavigationViewController.setViewControllers([safariViewController], animated: false)
                
                rootViewController.showDetailViewController(detailNavigationViewController, sender: nil)
            }
        })
        
        let navigationController = UINavigationController(rootViewController: masterRootViewController)
        navigationController.hidesBarsOnSwipe = true
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        
        return navigationController
    }()
    
    fileprivate static var detailNavigationViewController: UINavigationController = {
        
        let navigationController = UINavigationController()
        navigationController.hidesBarsOnSwipe = true
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        
        return navigationController
    }()
}
