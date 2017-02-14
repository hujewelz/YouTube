//
//  Seeting.swift
//  youtube
//
//  Created by jewelz on 2017/2/13.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class SettingLauncher: NSObject {
  
  let tableViewHeight: CGFloat = 6 * 44;
  
  let mask: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = UIColor(white: 0, alpha: 0.5)
    view.alpha = 0
    return view
  }()
  
  let tableView: UITableView = {
    let tableV = UITableView(frame: .zero)
    tableV.separatorStyle = .none
    tableV.isScrollEnabled = false
    tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableV
  }()
  
  let settins: [String] = {
    return ["Settings", "Terms & privacy", "Send Feedback", "Help", "Switch Account", "Cancel"]
  }()
  
  override init() {
    super.init()
    
    tableView.dataSource = self
    tableView.delegate = self
  }

  func show() {
    guard let window = UIApplication.shared.keyWindow else {
      return
    }
    
    if !window.subviews.contains(mask) {
      mask.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismiss)))
      window.addSubview(mask)
      window.addSubview(tableView)
      window.addConstraints(withVisualFormat: "H:|[v0]|", views: mask)
      window.addConstraints(withVisualFormat: "V:|[v0]|", views: mask)
      window.addConstraints(withVisualFormat: "H:|[v0]|", views: tableView)
      //window.addConstraints(withVisualFormat: "V:|[v0(220)]|", views: tableView)
      window.addConstraint(NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: window, attribute: .bottom, multiplier: 1, constant: 0))
      window.addConstraint(NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: window, attribute: .height, multiplier: 0, constant: tableViewHeight))
      
    }
    
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
      self.mask.alpha = 1
      self.tableView.transform = CGAffineTransform(translationX: 0, y: -self.tableViewHeight)
      }, completion: nil)
  }
  
  func dismiss() {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.mask.alpha = 0
      self.tableView.transform = CGAffineTransform.identity
      }, completion: nil)

  }

}

extension SettingLauncher: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settins.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = settins[indexPath.row]
    cell.imageView?.image = #imageLiteral(resourceName: "settings")
    return cell
  }
}
