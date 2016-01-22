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
    var repository = ItemsRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.list()
            .success(reloadItems)
            .failure(showErrorDescription)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: -
    
    private func reloadItems(items: [Item]) {
        self.items = items
        tableView.reloadData()
    }
    
    private func showErrorDescription(error: FriendlyErrorType?, isCanceled: Bool) {
        if isCanceled {
            return
        }
        
        guard let error = error else {
            return
        }
        
        let alertController = UIAlertController(error: error)
        presentViewController(alertController, animated: true, completion: nil)
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
