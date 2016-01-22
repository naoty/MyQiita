//
//  UIAlertController+FriendlyErrorType.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/18/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    convenience init(error: FriendlyErrorType) {
        let title = error.summary
        
        var message = ""
        if let reason = error.reason {
            message += reason
            message += "\n"
        }
        if let suggestion = error.suggestion {
            message += suggestion
        }
        
        self.init(title: title, message: message, preferredStyle: .Alert)
    }
}
