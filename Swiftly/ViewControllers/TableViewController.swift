//
//  TableViewController.swift
//  Swiftly
//
//  Created by Pete Smith on 04/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TableViewController<Cell: UITableViewCell>: UIViewController,
    UITableViewDelegate, UISearchBarDelegate where Cell: NibLoadable, Cell: Configurable {
    
    // MARK: - Properties (Private)
    fileprivate var table: UITableView!
    fileprivate var searchBar: UISearchBar!
    fileprivate var collectionAdapter: CollectionAdapter!
    fileprivate let disposeBag = DisposeBag()
    
    typealias NavigationAction = ((_ element: Any) -> Void)
    private var navigationAction: NavigationAction!
    
    // MARK: - Initialization
    
    init(withAdapter adapter: CollectionAdapter, tabBarItem: UITabBarItem, title: String,
         andNavigationAction navigationAction: @escaping NavigationAction) {
        
        self.collectionAdapter = adapter
        self.navigationAction = navigationAction
        
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = tabBarItem
        self.title = title
        
        configureTable()
        
        configureSearchBar()
        
        table.delegate = self
        
        // Register cell classes
        self.table.register(Cell.nib, forCellReuseIdentifier: Cell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAdapter.fetch()
    }
    
    // MARK: - Table Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let element = collectionAdapter[indexPath.item] else { return }
        
        navigationAction?(element)
    }
    
    // MARK: - SearchResultsUpdater
    
    func updateSearchResults(for searchController: UISearchController) {
        // todo
    }
}

// MARK: - Table Configuration
extension TableViewController {
    
    fileprivate func configureTable() {
        
        table = UITableView(frame: view.bounds)
        
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 70
        view.addSubview(table)
        
        // Constraints
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        configureTableDataSource()
    }
    
    fileprivate func configureSearchBar() {
    
        let searchBarFrame = CGRect(x: 0, y: 0, width: table.bounds.width, height: 44)
        searchBar = UISearchBar(frame: searchBarFrame)
        searchBar.backgroundColor = .white
        searchBar.tintColor = Color.searchBar.instance()
        searchBar.searchBarStyle = .minimal
        table.tableHeaderView = searchBar
        
        table.contentOffset = CGPoint(x: 0, y: -44)
    }
    
    fileprivate func configureTableDataSource() {
        
        // Bind via Rx
        collectionAdapter.viewModels.observeOn(
            MainScheduler.instance).bindTo(table.rx.items(cellIdentifier: Cell.identifier, cellType: Cell.self)) { (_, viewModel, cell) in
                cell.configure(withViewModel: viewModel)
        }.addDisposableTo(disposeBag)
    }
}
