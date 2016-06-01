//
//  TableView.swift
//  contact_app
//
//  Created by AJ on 5/29/16.
//  Copyright © 2016 AJ. All rights reserved.

// Author : Jadhav Amarnath and Amit Kumar

// Code Reference : Stack Overflow, Github

import UIKit
import Foundation


class TableView: UITableViewController {
    
    var contactInfo: Array<JSON>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.getData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getData(){
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType:"json")
        let data = NSData(contentsOfFile:filePath!)
        let json = JSON(data: data!)
        contactInfo = json["data"].array
    }
    
    // For refresh we refered the below link including stack overflow
    /* https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/ */
    
    func refresh(sender:AnyObject)
    {
        self.getData()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
    }
 
 
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactInfo!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let amaramith = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        amaramith.textLabel!.text = String(contactInfo![indexPath.row][0])
        amaramith.detailTextLabel!.text = String(contactInfo![indexPath.row][1])
        return amaramith
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            contactInfo!.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell {
            let i =  tableView.indexPathForCell(cell)!.row
            if segue.identifier == "showDetail" {
                let viewc = segue.destinationViewController as! ViewController
                viewc.infor = contactInfo![i].array
            }
        }
    }
    
    
}
