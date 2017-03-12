//
//  AttributedString.swift
//  Swiftly
//
//  Created by Pete Smith on 07/03/2017.
//  Copyright © 2017 Pete Smith. All rights reserved.
//

import Foundation
import UIKit

/// Custom String type with attributed string-type behaviour
struct BetterString {
    
    fileprivate var _internalString: String!
    
    // MARK: - Public API
    
    // MARK: - Initialization
    
    init(withString string: String) {
        _internalString = string
    }
}

// MARK: - Attributed formatting
extension BetterString {
    
    func attributed(withLineHeight lineHeight: Int) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = CGFloat(lineHeight)
        paragraphStyle.maximumLineHeight = CGFloat(lineHeight)
        
        return NSAttributedString(string: _internalString, attributes: [NSParagraphStyleAttributeName: paragraphStyle])
    }
}

extension BetterString: ExpressibleByUnicodeScalarLiteral {
    
    typealias UnicodeScalarLiteralType = String.UnicodeScalarLiteralType
    
    init(unicodeScalarLiteral value: BetterString.UnicodeScalarLiteralType) {
        _internalString = String(unicodeScalarLiteral: value)
    }
}

extension BetterString: ExpressibleByExtendedGraphemeClusterLiteral {
    
    typealias ExtendedGraphemeClusterLiteralType = String.ExtendedGraphemeClusterLiteralType
    
    init(extendedGraphemeClusterLiteral: BetterString.ExtendedGraphemeClusterLiteralType) {
        _internalString = String(extendedGraphemeClusterLiteral: extendedGraphemeClusterLiteral)
    }
}

// MARK: - ExpressibleByStringLiteral conformance
extension BetterString: ExpressibleByStringLiteral {
    
    typealias StringLiteralType = String
    
    init(stringLiteral: BetterString.StringLiteralType) {
        _internalString = stringLiteral
    }
}
