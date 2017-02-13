//
//  ProposalCell.swift
//  Swiftly
//
//  Created by Pete Smith on 05/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit
import SwiftEvolutionProvider

class ProposalCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet fileprivate weak var title: UILabel!

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension ProposalCell: Configurable {
    
    func configure(withViewModel viewModel: Any) {
        
        guard let proposal = viewModel as? Proposal else { fatalError() }
        
        title.text = proposal.title
    }
}
