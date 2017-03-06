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
            return .gray
        }
    }
    
    var localizedTitle: String {
        switch self {
        case .accepted:
            return self.rawValue.capitalized
        case .activeReview:
            return "Active Review"
        case .returned:
            return self.rawValue.capitalized
        case .deferred:
            return self.rawValue.capitalized
        case .implemented:
            return self.rawValue.capitalized
        case .rejected, .withdrawn:
            return self.rawValue.capitalized
        default:
            return self.rawValue.capitalized
        }
    }
}
