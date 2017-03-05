//
//  State+Extensions.swift
//  Swiftly
//
//  Created by Pete Smith on 05/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import SwiftEvolutionProvider

extension State {
    
    var color: UIColor {
        switch self {
        case .accepted:
            return .green
        case .activeReview, .returned:
            return .orange
        case .deferred:
            return .purple
        case .implemented:
            return .blue
        case .rejected, .withdrawn:
            return .red
        default:
            return .darkGray
        }
    }
    
//    var localizedTitle: String {
//        switch self {
//        case .accepted:
//            return 
//        case .activeReview, .returned:
//            return .orange
//        case .deferred:
//            return .purple
//        case .implemented:
//            return .blue
//        case .rejected, .withdrawn:
//            return .red
//        default:
//            return .darkGray
//        }
//    }
}
