//
//  ItemsViewController.swift
//  MyQiita
//
//  Created by Naoto Kaneko on 1/15/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        items.append(Item(title: "item 1"))
//        items.append(Item(title: "item 2"))
//        items.append(Item(title: "item 3"))
//        items.append(Item(title: "item 4"))
//        items.append(Item(title: "item 5"))
        items = ItemsRepository().list()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
        cell.textLabel?.text = item.title

        return cell
    }
}
