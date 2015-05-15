//
//  SearchTableViewCell.swift
//  director
//
//  Created by Steven Lu on 1/5/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {

    var nameLabel: UILabel?
    var dateAndStatusLabel: UILabel?

    func setUpCell() {

        let screenSize: CGRect = UIScreen.mainScreen().bounds

        nameLabel = UILabel(frame: CGRect(x: 20, y: 25, width: screenSize.width-40, height: 20))
        nameLabel?.font = UIFont.primaryFontBoldWithSize(20)
        self.addSubview(nameLabel!)

        dateAndStatusLabel = UILabel(frame: CGRect(x: 20, y: 50, width: screenSize.width-40, height: 20))
        dateAndStatusLabel?.font = UIFont.primaryFontWithSize(16)
        self.addSubview(dateAndStatusLabel!)

    }

    func configureWithPackage(package:AnyObject) {

        nameLabel?.text = package["name_formatted"] as NSString
        dateAndStatusLabel?.text = (package["status_formatted"] as NSString) + " — " + (package["delivery_date_calendar_formatted"] as NSString)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}