//
//  Store.swift
//  Swiftly
//
//  Created by Pete Smith on 06/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import RxCocoa
import RxSwift

/// Generic data store
public struct Store<Element> {
    
    // MARK: - Properties (Public)
    public var observableElements: Observable<[Element]> {
        mutating get {
            return elements.asObservable()
        }
    }
    
    // MARK: - Properties (Private)
    fileprivate lazy var elements: Variable<[Element]> = Variable([])
}

public extension Store {
    
    public mutating func add(_ elements: [Element]) {
        self.elements.value.append(contentsOf: elements)
    }
}
