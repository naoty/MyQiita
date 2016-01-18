//
//  Item.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/15/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import Himotoki

class Item: Decodable {
    let title: String
    let urlString: String
    
    init(title: String, urlString: String) {
        self.title = title
        self.urlString = urlString
    }
    
    static func decode(e: Extractor) throws -> Item {
        return try Item(
            title: e <| "title",
            urlString: e <| "url"
        )
    }
}
