//
//  ViewController.swift
//  NSDateUtil
//
//  Created by Saurav Satpathy on 15/11/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()        
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as! CustomCell
        cell.nameLabel.text = "CocoaJuice"
        cell.addressLabel.text = "Cupertino, California"
        let fromDate : NSDate = NSDate().dateByAddingTimeInterval(-3600*2);
        let toDate : NSDate = NSDate();
        cell.timeLabel.text = NSDate.timeAgo(toDate, fromDate: fromDate)
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

