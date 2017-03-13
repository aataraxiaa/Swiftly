//
//  Post.swift
//  Swiftly
//
//  Created by Pete Smith on 13/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import Foundation

struct Post {
    
    let title: String
    let url: URL?
}

extension Post {
    
    init(withTitle title: String, andUrl url: String) {
        
        self.title = title
        self.url = URL(string: url)
    }
}
