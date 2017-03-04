//
//  NibLoadable.swift
//  Swiftly
//
//  Created by Pete Smith on 05/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension NibLoadable {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UITableViewCell: NibLoadable {}
