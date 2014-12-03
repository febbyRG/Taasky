//
//  MenuViewController.swift
//  Taasky
//
//  Created by Mic Pringle on 18/11/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
  
  lazy var menuItems: NSArray! = {
    let path = NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")
    return NSArray(contentsOfFile: path!)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateSelectedMenuItem(menuItems[0] as NSDictionary)
    // Remove the drop shadow from the navigation bar
    navigationController!.navigationBar.clipsToBounds = true
  }
  
  // MARK: UITableViewDataSource
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems.count
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return max(80, CGRectGetHeight(view.bounds) / 6)
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell") as MenuItemCell
    let menuItem = menuItems[indexPath.row] as NSDictionary
    cell.configureForMenuItem(menuItem)
    return cell
  }
  
  // MARK: UITableViewDelegate
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let menuItem = menuItems[indexPath.row] as NSDictionary
    updateSelectedMenuItem(menuItem)
  }
  
  // MARK: Private
  
  func updateSelectedMenuItem(menuItem: NSDictionary) {
    let containerViewController = navigationController!.parentViewController as ContainerViewController
    containerViewController.menuItem = menuItem
  }
  
}