//
//  AppDelegate.swift
//  Taasky
//
//  Created by Mic Pringle on 18/11/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    application.statusBarStyle = UIStatusBarStyle.LightContent
    return true
  }
}

