//
//  ItemsRepository.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftTask
import Himotoki

struct ItemsRepository: Repository {
    func list() -> Task<Void, [Item], FriendlyErrorType> {
        return Task<Void, [Item], FriendlyErrorType> { progress, fulfill, reject, configure in
            Alamofire.request(.GET, "https://qiita.com/api/v2/items").responseJSON { response in
                switch response.result {
                case .Success(let value):
                    if let objects = value as? [AnyObject] {
                        var items: [Item] = []
                        for object in objects {
                            do {
                                let item = try decode(object) as Item
                                items.append(item)
                            } catch DecodeError.MissingKeyPath(let keyPath) {
                                reject(ApplicationError.DecodeFailed(keyPath.components))
                            } catch {
                                reject(ApplicationError.SomethingWrong)
                            }
                        }
                        fulfill(items)
                    } else {
                        reject(ApplicationError.DecodeFailed(["root"]))
                    }
                case .Failure(let error):
                    reject(error)
                }
            }
        }
    }
}
