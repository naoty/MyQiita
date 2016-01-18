//
//  UIAlertController+ErrorDialog.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/18/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    convenience init(error: NSError) {
        let title = error.localizedDescription
        
        var message = ""
        if let reason = error.localizedFailureReason {
            message += reason
            message += "\n"
        }
        if let suggestion = error.localizedRecoverySuggestion {
            message += suggestion
        }
        
        self.init(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        addAction(defaultAction)
    }
}
