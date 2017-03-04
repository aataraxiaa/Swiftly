//
//  ProposalCell.swift
//  Swiftly
//
//  Created by Pete Smith on 04/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import SwiftEvolutionProvider

class ProposalCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet fileprivate var title: UILabel!
    
    
}

extension ProposalCell: Configurable {
    
    func configure(withViewModel viewModel: Any) {
        
        guard let proposal = viewModel as? Proposal else { fatalError() }
        
        title.text = proposal.title
    }
}
