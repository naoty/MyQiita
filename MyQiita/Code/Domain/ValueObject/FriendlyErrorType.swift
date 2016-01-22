//
//  FriendlyErrorType.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/22/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

protocol FriendlyErrorType: ErrorType {
    var summary: String { get }
    var reason: String? { get }
    var suggestion: String? { get }
}
