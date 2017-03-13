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
        splitViewController.viewControllers = [Router.tabBarController]
        
        return splitViewController
    }()
    
    // MARK: - Properities (Private)
}

private typealias PrivateAPI = Router
fileprivate extension PrivateAPI {
    
    fileprivate static var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        
        // Configure the tab view controllers
        tabBarController.viewControllers = [Router.newsNavigationViewController,
                                            Router.proposalNavigationViewController]
        
        return tabBarController
    }()
    
    fileprivate static var proposalNavigationViewController: UINavigationController = {
        
        
        let navigationController = UINavigationController(rootViewController: proposalViewController)
        navigationController.tabBarItem = proposalViewController.tabBarItem
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        return navigationController
    }()
    
    fileprivate static var proposalViewController: TableViewController<ProposalCell> = {
        
        let proposalTabBarItem = UITabBarItem(title: "Proposals", image: nil, tag: 0)
    
        return TableViewController<ProposalCell>(withAdapter: ProposalAdapter(),
                                                 tabBarItem: proposalTabBarItem,
                                                 title: "Swift Evolution Proposals",
                                                 andNavigationAction: { element in
            
            if let proposal = element as? Proposal {
                guard let url = URL(
                    string: "https://github.com/apple/swift-evolution/blob/master/proposals/"+proposal.link) else { return }
                
                let safariViewController = SFSafariViewController(url: url)
                
                rootViewController.showDetailViewController(safariViewController, sender: nil)
            }
        })
    }()
    
    // MARK: - Curated News
    
    fileprivate static var newsNavigationViewController: UINavigationController = {
        
        let navigationController = UINavigationController(rootViewController: newsViewController)
        navigationController.tabBarItem = newsViewController.tabBarItem
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = Color.navigationBar.instance()
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        return navigationController
    }()
    
    fileprivate static var newsViewController: TableViewController<PostCell> = {
        
        let newsTabBarItem = UITabBarItem(title: "Posts", image: nil, tag: 0)
        
        return TableViewController<PostCell>(withAdapter: PostAdapter(),
                                                 tabBarItem: newsTabBarItem,
                                                 title: "Posts",
                                                 andNavigationAction: { element in
                                                    
            guard let post = element as? Post, let url = post.url else { return }
                
            let safariViewController = SFSafariViewController(url: url)
                
            rootViewController.showDetailViewController(safariViewController, sender: nil)
            
        })
    }()
}
