//
//  CollectionAdapter.swift
//  Swiftly
//
//  Created by Pete Smith on 12/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import RxCocoa
import RxSwift

protocol CollectionAdapter {
    
    // MARK: - Properties
    var viewModels: Observable<[Any]> { get }
    var isPagable: Bool { get }
    
    // MARK: - Functions
    func fetch()
}
