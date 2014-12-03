//
//  MenuItemCell.swift
//  Taasky
//
//  Created by Mic Pringle on 03/12/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {
  
  @IBOutlet weak var menuItemImageView: UIImageView!
  
  func configureForMenuItem(menuItem: NSDictionary) {
    menuItemImageView.image = UIImage(named: menuItem["image"] as NSString)
    backgroundColor = UIColor(colorArray: menuItem["colors"] as NSArray)
  }
  
}
