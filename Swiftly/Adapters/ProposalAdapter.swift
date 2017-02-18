//
//  EvolutionAdapter.swift
//  Swiftly
//
//  Created by Pete Smith on 12/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import RxCocoa
import RxSwift
import SwiftEvolutionProvider

struct ProposalAdapter: CollectionAdapter {
    
    var viewModels: Observable<[Any]> {
        return elements.asObservable()
    }
    
    var isPagable: Bool {
        return false
    }
    
    private var elements: Variable<[Any]> = Variable([])
    
    func fetch() {
        _ = ProposalProvider.proposals(withSuccess: { proposals in
            
            self.elements.value = proposals
            
        }, andFailure: { error in
                
        } )
    }
    
    subscript(index: Int) -> Any? {
        guard index < elements.value.count && !elements.value.isEmpty else { return nil }
        
        return elements.value[index]
    }
}
