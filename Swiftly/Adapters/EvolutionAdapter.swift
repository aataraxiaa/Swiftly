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

struct EvolutionAdapter: CollectionAdapter {
    
    var viewModels: Observable<[Any]> {
        return Variable([]).asObservable()
    }
    
    var isPagable: Bool {
        return false
    }
    
    private var elements: Variable<[Proposal]> = Variable([])
    
    func fetch() {
        _ = ProposalProvider.proposals(withSuccess: { proposals in
            
            self.elements.value = proposals
            
        }, andFailure: { error in
                
        } )
    }
}
