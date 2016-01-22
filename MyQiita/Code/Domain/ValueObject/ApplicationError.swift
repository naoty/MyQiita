//
//  ApplicationError.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/22/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

enum ApplicationError: FriendlyErrorType {
    case SomethingWrong
    case DecodeFailed([String])
    
    // TODO: Localized texts using NSLocalizedString()
    
    var summary: String {
        switch self {
        case .SomethingWrong:
            return "Something wrong"
        case .DecodeFailed:
            return "Decode failed"
        }
    }
    
    var reason: String? {
        switch self {
        case .SomethingWrong:
            return .None
        case .DecodeFailed(let fields):
            let failedFields = fields.joinWithSeparator(", ")
            return "Failed to decode following fields: \(failedFields)"
        }
    }
    
    var suggestion: String? {
        switch self {
        case .SomethingWrong:
            return .None
        case .DecodeFailed:
            return .None
        }
    }
}

extension ApplicationError: CustomStringConvertible {
    var description: String {
        return summary
    }
}

extension ApplicationError: CustomDebugStringConvertible {
    var debugDescription: String {
        return summary
    }
}
