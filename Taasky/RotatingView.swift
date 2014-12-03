//
//  RotatingView.swift
//  Taasky
//
//  Created by Mic Pringle on 03/12/2014.
//  Copyright (c) 2014 Mic Pringle. All rights reserved.
//

import UIKit

class RotatingView: UIView {
  
  let imageView: UIImageView! = UIImageView(image: UIImage(named: "Hamburger"))
  
  // MARK: UIView
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  required override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  // MARK: RotatingView
  
  func rotate(percent: CGFloat) {
    let angle = Double(percent) * M_PI_2
    imageView.transform = CGAffineTransformMakeRotation(CGFloat(angle))
  }
  
  // MARK: Private
  
  private func configure() {
    imageView.contentMode = UIViewContentMode.Center
    addSubview(imageView)
  }

}
