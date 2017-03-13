//
//  PostCell.swift
//  Swiftly
//
//  Created by Pete Smith on 13/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet fileprivate var title: UILabel!
}

extension PostCell: Configurable {
    
    func configure(withViewModel viewModel: Any) {
        
        guard let post = viewModel as? Post else { fatalError() }
        
        title.attributedText = BetterString(withString: post.title).attributed(withLineHeight: 20)
    }
}
