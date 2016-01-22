//
//  Repository.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import SwiftTask

protocol Repository {
    typealias Domain
    
    func list() -> Task<Void, [Domain], FriendlyErrorType>
    func find(id: Int) -> Task<Void, Domain, FriendlyErrorType>
}

extension Repository {
    func list() -> Task<Void, [Domain], FriendlyErrorType> {
        fatalError("-list() is not implemented.")
    }
    
    func find(id: Int) -> Task<Void, Domain, FriendlyErrorType> {
        fatalError("-find(id:) is not implemented.")
    }
}
