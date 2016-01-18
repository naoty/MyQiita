//
//  Error.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/18/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

struct Error {
    static let Domain = "com.github.naoty.MyQiita.error"
    
    enum Code: Int {
        case RequestCanceled = -1000
        case DecodeFailed    = -2000
        case SomethingWrong  = -9999
    }
    
    static func errorWithCode(code: Code, failureReason: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        return NSError(domain: Domain, code: code.rawValue, userInfo: userInfo)
    }
}
