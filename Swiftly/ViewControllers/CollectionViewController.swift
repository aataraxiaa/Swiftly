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

class CollectionViewController<Cell: UICollectionViewCell>: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout where Cell: NibLoadable, Cell: Configurable {
    
    // MARK: - Properties (Public)
    
    // MARK: - Properties (Private)
    fileprivate var collectionView: UICollectionView!
    fileprivate var collectionAdapter: CollectionAdapter!
    fileprivate let disposeBag = DisposeBag()
    fileprivate var navigationAction: ((_ element: Any) -> Void)!
    
    // MARK: - Initialization
    
    init(withAdapter adapter: CollectionAdapter, andNavigationAction navigationAction: @escaping (_ element: Any) -> Void) {
        self.collectionAdapter = adapter
        self.navigationAction = navigationAction
        
        super.init(nibName: nil, bundle: nil)
        
        addAndBindCollectionView()
        
        collectionView.delegate = self
        
        // Register cell classes
        self.collectionView.register(Cell.nib, forCellWithReuseIdentifier: Cell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAdapter.fetch()
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let element = collectionAdapter[indexPath.item] else { return }
        
        navigationAction?(element)
    }
    
    // MARK: - Layout
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Transition to new trait")
        super.willTransition(to: newCollection, with: coordinator)
        
        
        collectionView.performBatchUpdates({
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
    
    // MARK: - Flow Layout Delegate
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fullWidth = CGSize(width: collectionView.bounds.width, height: 70)
        return fullWidth
    }
}

// MARK: - PrivateAPI
fileprivate extension CollectionViewController {
    
    fileprivate func addAndBindCollectionView() {
        
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
