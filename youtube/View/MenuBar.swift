//
//  MenuBar.swift
//  youtube
//
//  Created by jewelz on 2017/2/12.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class MenuBar: UIView {
  let selectedImages = [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "trending"), #imageLiteral(resourceName: "subscriptions"), #imageLiteral(resourceName: "account")]
  let images = [#imageLiteral(resourceName: "home_dark"), #imageLiteral(resourceName: "trending_dark"), #imageLiteral(resourceName: "subscriptions_dark"),#imageLiteral(resourceName: "account_dark")]
  var lastSelectedItemIndex = 0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.red
    translatesAutoresizingMaskIntoConstraints = false
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let width = frame.width / 4;
    for (i, button) in subviews.enumerated() {
      button.frame = CGRect(x: CGFloat(i)*width, y: 0, width: width, height: frame.height)
    }
  }
  
  func setupViews() {
    for (index, img) in images.enumerated() {
      let button = UIButton(frame: .zero)
      button.tag = index + 99
      button.isSelected = index == 0
      button.setImage(img, for: .normal)
      button.setImage(selectedImages[index], for: .highlighted)
      button.setImage(selectedImages[index], for: .selected)
      button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
      addSubview(button)
    }
  }
  
  func buttonClicked(sender: UIButton) {
    if sender.isEnabled && sender.tag == lastSelectedItemIndex+99 {
      return
    }
    
    sender.isSelected = !sender.isSelected
    let button: UIButton = subviews[lastSelectedItemIndex] as! UIButton
    button.isSelected = !sender.isSelected
    
    lastSelectedItemIndex = sender.tag - 99
  }
}
