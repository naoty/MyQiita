//
//  ItemsRepository.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import SwiftTask

struct ItemsRepository: Repository {
    func list() -> Task<Void, [Item], NSError> {
        let items = [
            Item(title: "item 1"),
            Item(title: "item 2"),
            Item(title: "item 3"),
            Item(title: "item 4"),
            Item(title: "item 5")
        ]
        
        return Task(value: items)
    }
}
