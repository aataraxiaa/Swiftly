//
//  CollectionViewController.swift
//  Swiftly
//
//  Created by Pete Smith on 05/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CollectionViewController<Cell: UICollectionViewCell>: UIViewController where Cell: NibLoadable, Cell: Configurable {
    
    // MARK: - Properties (Public)
    
    // MARK: - Properties (Private)
    fileprivate var collectionView: UICollectionView!
    fileprivate var collectionAdapter: CollectionAdapter!
    fileprivate let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    
    init(withAdapter adapter: CollectionAdapter) {
        self.collectionAdapter = adapter
        
        super.init(nibName: nil, bundle: nil)
        
        addAndBindCollectionView()
        
        // Register cell classes
        self.collectionView!.register(Cell.nib, forCellWithReuseIdentifier: Cell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - PrivateAPI
fileprivate extension CollectionViewController {
    
    fileprivate func addAndBindCollectionView() {
        
        self.collectionView = UICollectionView()
        view.addSubview(collectionView)
        
        // Constraints
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Bind via Rx
        collectionAdapter.viewModels.observeOn(
            MainScheduler.instance).bindTo(collectionView.rx.items(
                cellIdentifier: Cell.identifier, cellType: Cell.self)){ (_, viewModel, cell) in
        
                    cell.configure(withViewModel: viewModel)
                    
        }.addDisposableTo(disposeBag)
    }
}
