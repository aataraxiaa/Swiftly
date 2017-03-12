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
    @IBOutlet fileprivate var status: UILabel!
    @IBOutlet fileprivate var id: UILabel!
    @IBOutlet fileprivate var title: UILabel!
    @IBOutlet fileprivate var statusIcon: UIView!
    
}

extension ProposalCell: Configurable {
    
    func configure(withViewModel viewModel: Any) {
        
        guard let proposal = viewModel as? Proposal else { fatalError() }
        
//        status.text = proposal.status.state.rawValue.uppercased()
//        let statusColor = proposal.status.state.color
//        status.textColor = statusColor
//        status.layer.borderColor = statusColor.cgColor
//        
//        id.text = proposal.id
        
        // Title
        let trimmedTitle = proposal.title.trimmingCharacters(in: .whitespacesAndNewlines)
        title.attributedText = BetterString(withString: trimmedTitle).attributed(withLineHeight: 20)
        
        // Status
        let statusText = proposal.status.localizedTitle
        status.text = statusText
        statusIcon.backgroundColor = proposal.status.color
        statusIcon.layer.cornerRadius = 5
    }
}
