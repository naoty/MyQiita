//
//  Repository.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

protocol Repository {
    typealias Domain
    
    func list() -> [Domain]
    func find(id: Int) -> Domain?
}

extension Repository {
    func list() -> [Domain] {
        assertionFailure("Not implemented.")
        return []
    }
    
    func find(id: Int) -> Domain? {
        assertionFailure("Not implemented")
        return nil
    }
}
