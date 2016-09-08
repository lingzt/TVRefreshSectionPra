//
//  TableViewController.swift
//  TVRefreshSectionPra
//
//  Created by ling toby on 9/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataArray = [[1,2],[3,4]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sectionNumber = 0
        return dataArray[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "_________________Section \(section)"
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red:0.93, green:0.20, blue:0.20, alpha:1.0)
        
        return headerView
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var intTobePlaced = dataArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(intTobePlaced)"
    
        return cell
    }

    @IBAction func refreshSec2(sender: AnyObject) {
        dataArray[0] = dataArray[0].map{$0 + 1}
        dataArray[1] = dataArray[1].map{$0 + 1}
        
        let section = NSIndexSet(index:1)
        self.tableView.reloadSections(section, withRowAnimation: UITableViewRowAnimation.Automatic)
        print(dataArray.description)
    }
    
    @IBAction func refreshSec1Bar1(sender: AnyObject) {
        var indexPaths = [NSIndexPath]()
        dataArray[0] = dataArray[0].map{$0 - 1}
        dataArray[1] = dataArray[1].map{$0 - 1}
        var  indexPath = NSIndexPath(forRow: 0, inSection: 0)
        indexPaths.append(indexPath)
        self.tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
        print(dataArray.description)
    }

}
