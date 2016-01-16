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
    
    func list() -> Task<Void, [Domain], NSError>
    func find(id: Int) -> Task<Void, Domain, NSError>
}

extension Repository {
    func list() -> Task<Void, [Domain], NSError> {
        assertionFailure("Not implemented")
        return Task(error: NSError(domain: "", code: 0, userInfo: nil))
    }
    
    func find(id: Int) -> Task<Void, Domain, NSError> {
        assertionFailure("Not implemented")
        return Task(error: NSError(domain: "", code: 0, userInfo: nil))
    }
}
