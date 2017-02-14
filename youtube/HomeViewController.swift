//
//  ViewController.swift
//  youtube
//
//  Created by jewelz on 2017/2/12.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let settingLauncher = SettingLauncher()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
    titleView.textColor = UIColor.white
    titleView.font = UIFont.systemFont(ofSize: 20)
    titleView.text = "Youtube"
    navigationItem.titleView = titleView
    
    let search = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchAction))
    let more = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(moreAction))
    navigationItem.rightBarButtonItems = [more, search]
    
    let menuBar = MenuBar(frame: .zero)
    view.addSubview(menuBar)
    
    
    view.addConstraints(withVisualFormat: "H:|[v0]|", views: menuBar)
    view.addConstraints(withVisualFormat: "V:|[v0(44)]", views: menuBar)
    collectionView?.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
  }
  
  func searchAction() {
  
  }
  
  func moreAction() {
    settingLauncher.show()
  }
  
}

extension HomeViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath)
    return cell
  }
  
  @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let thunbnailHeight = (view.frame.width - 16) * 9 / 16
    return CGSize(width: view.frame.width, height: thunbnailHeight+60)
  }
  
  @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}


