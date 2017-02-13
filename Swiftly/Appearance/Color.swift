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
            return UIColor(displayP3Red: 0.96, green: 0.51, blue: 0.47, alpha: 1.0)
        }
    }
}
