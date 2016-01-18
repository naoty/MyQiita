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
    func list() -> Task<Void, [Item], NSError> {
        return Task<Void, [Item], NSError> { progress, fulfill, reject, configure in
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
                                reject(Error.errorWithCode(.DecodeFailed, failureReason: "Failed to decode \(keyPath)"))
                                break
                            } catch {
                                reject(Error.errorWithCode(.SomethingWrong, failureReason: ""))
                                break
                            }
                        }
                        fulfill(items)
                    } else {
                        reject(Error.errorWithCode(.DecodeFailed, failureReason: "Failed to decode the root"))
                    }
                case .Failure(let error):
                    reject(error)
                }
            }
        }
    }
}
