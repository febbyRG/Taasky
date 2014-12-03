//
//  ContainerViewController.swift
//  Taasky
//
//  Created by Mic Pringle on 18/11/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var menuContainerView: UIView!
  
  var menuItem: NSDictionary? {
    didSet {
      updateMenu(false, animated: true)
      if let detailViewController = findDetailViewController() {
        detailViewController.menuItem = menuItem
      }
    }
  }
  
  var showingMenu = false
  
  // MARK: UIViewController
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    menuContainerView.layer.anchorPoint = CGPointMake(1.0, 0.5)
    updateMenu(showingMenu, animated: false)
  }
  
  // MARK: ContainerViewController
  
  func updateMenu(show: Bool, animated: Bool) {
    let xOffset = CGRectGetWidth(menuContainerView.bounds)
    scrollView.setContentOffset(show ? CGPointZero : CGPointMake(xOffset, 0), animated: animated)
    showingMenu = show
  }
  
  // MARK: UIScrollViewDelegate
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    let xOffset = CGRectGetWidth(menuContainerView.bounds)
    showingMenu = !CGPointEqualToPoint(CGPointMake(xOffset, 0), scrollView.contentOffset)
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let multiplier = 1.0 / CGRectGetWidth(menuContainerView.bounds)
    let offset = scrollView.contentOffset.x * multiplier
    let percent = 1.0 - offset
    menuContainerView.layer.transform = transformForPercent(percent)
    menuContainerView.alpha = percent
    if let detailViewController = findDetailViewController() {
      if let rotatingView = detailViewController.rotatingView {
        rotatingView.rotate(percent)
      }
    }
  }
  
  // MARK: Private
  
  func transformForPercent(percent:CGFloat) -> CATransform3D {
    var identity = CATransform3DIdentity
    identity.m34 = -1.0 / 1000.0;
    let angle = Double(1.0 - percent) * -M_PI_2
    let xOffset = CGRectGetWidth(menuContainerView.bounds) * 0.5
    let rotateTransform = CATransform3DRotate(identity, CGFloat(angle), 0.0, 1.0, 0.0)
    let translateTransform = CATransform3DMakeTranslation(xOffset, 0.0, 0.0)
    return CATransform3DConcat(rotateTransform, translateTransform)
  }
  
  func findDetailViewController() -> DetailViewController? {
    var detailViewController: DetailViewController! = nil
    for controller in childViewControllers {
      let navigationController = controller as UINavigationController
      if navigationController.topViewController.isKindOfClass(DetailViewController) {
        detailViewController = navigationController.topViewController as DetailViewController
      }
    }
    return detailViewController
  }

}
