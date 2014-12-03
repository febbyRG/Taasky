//
//  DetailViewController.swift
//  Taasky
//
//  Created by Mic Pringle on 18/11/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  var rotatingView: RotatingView?
  
  var menuItem: NSDictionary? {
    didSet {
      if let newMenuItem = menuItem {
        backgroundImageView.image = UIImage(named: newMenuItem["bigImage"] as NSString)
        view.backgroundColor = UIColor(colorArray: newMenuItem["colors"] as NSArray)
      }
    }
  }
  
  // MARK: UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "rotatingViewTapped")
    rotatingView = RotatingView(frame: CGRectMake(0, 0, 20, 20))
    rotatingView!.addGestureRecognizer(tapGestureRecognizer)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rotatingView!)
    // Remove the drop shadow from the navigation bar
    navigationController!.navigationBar.clipsToBounds = true
  }
  
  // MARK: DetailViewController
  
  func rotatingViewTapped() {
    let navigationController = parentViewController as UINavigationController
    let containerViewController = navigationController.parentViewController as ContainerViewController
    containerViewController.updateMenu(!containerViewController.showingMenu, animated: true)
  }
  
}