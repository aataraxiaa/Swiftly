//
//  Color.swift
//  Swiftly
//
//  Created by Pete Smith on 05/02/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import UIKit

enum Color {
    case navigationBar
}

extension Color {
    
    func instance() -> UIColor {
        switch self {
        case .navigationBar:
            return #colorLiteral(red: 0.9792123437, green: 0.5946284533, blue: 0.5394276977, alpha: 1)
        }
    }
}
