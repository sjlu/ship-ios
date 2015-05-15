//
//  SearchViewController.swift
//  director
//
//  Created by Steven Lu on 1/4/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit
import Alamofire

class ListPackagesViewController: UITableViewController, UISearchBarDelegate {

    var data: NSMutableArray?
    //    var disableViewOverlay: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var screenBounds = UIScreen.mainScreen().bounds;

        self.title = "Imparcel"
//        self.view.backgroundColor = UIColor.lightGrayColor()

        self.data = NSMutableArray()

        getPackages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // search
    func getPackages() {
        Alamofire.request(
            Router.Packages()
            ).responseJSON { (request, response, data, error) in
                self.data = data as? NSMutableArray
                self.tableView.reloadData()
        }
    }

    // close button related
    func closeButtonPressed(sender:AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // tableview realted
    override func viewDidLayoutSubviews() {
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.layoutMargins = UIEdgeInsetsZero
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.data == nil {
            return 0
        } else {
            return self.data!.count
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }

    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        var cell:SearchTableViewCell? = tableView.dequeueReusableCellWithIdentifier("SearchTableViewCell", forIndexPath: indexPath) as? SearchTableViewCell
        var cell : PackageTableViewCell? = tableView.dequeueReusableCellWithIdentifier("PackageTableViewCell") as? PackageTableViewCell
        if cell == nil {
            cell = PackageTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "PackageTableViewCell")
            cell?.setUpCell()
        }

        var cellData:AnyObject? = self.data?.objectAtIndex(indexPath.row)
        cell?.configureWithPackage(cellData!)
        //        cell?.textLabel?.text = "rawrasdfasdfasdfasdf"
        //        cell!.backgroundColor = UIColor.greenColor();
        return cell!
    }
    
}