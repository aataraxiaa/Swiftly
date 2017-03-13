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
import FirebaseDatabase

struct PostAdapter: CollectionAdapter {
    
    // MARK: - Properties (Public)
    
    var viewModels: Observable<[Any]> {
        return elements.asObservable()
    }
    
    var isPagable: Bool {
        return false
    }
    
    // MARK: - Properties (Private)
    
    private var elements: Variable<[Any]> = Variable([])
    
    var ref = FIRDatabase.database().reference().child("swiftly").child("posts")
    
    // MARK: - Public API
    
    func fetch() {
        
        // Listen for FirebaseDatabase changes
        _ = ref.observe(.childAdded, with: { (snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for case let posts as [Int : Any] in postDict.values {
                print(posts)
            }
        })
    }
    
    subscript(index: Int) -> Any? {
        guard index < elements.value.count && !elements.value.isEmpty else { return nil }
        
        return elements.value[index]
    }
}
