//
//  NSError+FriendlyErrorType.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/22/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

extension NSError: FriendlyErrorType {
    var summary: String {
        return localizedDescription
    }
    
    var reason: String? {
        return userInfo[NSLocalizedFailureReasonErrorKey] as? String
    }
    
    var suggestion: String? {
        return userInfo[NSLocalizedRecoverySuggestionErrorKey] as? String
    }
}
