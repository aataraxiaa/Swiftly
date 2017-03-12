//
//  State+Extensions.swift
//  Swiftly
//
//  Created by Pete Smith on 05/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import SwiftEvolutionProvider

extension Status {
    
    var color: UIColor {
        switch self.state {
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
        switch self.state {
        case .accepted:
            return self.state.rawValue.capitalized
        case .activeReview:
            return "Active Review"
        case .returned:
            return self.state.rawValue.capitalized
        case .deferred:
            return self.state.rawValue.capitalized
        case .implemented:
            guard let version = version else {
                return self.state.rawValue.capitalized
            }
            return self.state.rawValue.capitalized + " (Swift \(version))"
        case .rejected, .withdrawn:
            return self.state.rawValue.capitalized
        default:
            return self.state.rawValue.capitalized
        }
    }
}
