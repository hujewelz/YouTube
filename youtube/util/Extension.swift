//
//  Extension.swift
//  youtube
//
//  Created by jewelz on 2017/2/13.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

extension UIView {
  func addConstraints(withVisualFormat vf: String, views: UIView...) {
    
    var viewsDict = [String : Any]()
    for (i, view) in views.enumerated() {
      let key = "v\(i)"
      viewsDict[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    guard !viewsDict.isEmpty else {
      return
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vf, options: .directionLeadingToTrailing, metrics: nil, views: viewsDict))
  }
}

