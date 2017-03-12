//
//  NewsFeedAdapter.swift
//  Swiftly
//
//  Created by Pete Smith on 12/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Firebase

struct NewsFeedAdapter: CollectionAdapter {
    
    // MARK: - Properties (Public)
    
    var viewModels: Observable<[Any]> {
        return elements.asObservable()
    }
    
    var isPagable: Bool {
        return false
    }
    
    // MARK: - Properties (Private)
    
    private var elements: Variable<[Any]> = Variable([])
    
    var ref = FIRDatabase.database().reference()
    
    // MARK: - Public API
    
    func fetch() {
        
    }
    
    subscript(index: Int) -> Any? {
        guard index < elements.value.count && !elements.value.isEmpty else { return nil }
        
        return elements.value[index]
    }
}
