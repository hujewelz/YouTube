//
//  VideoCell.swift
//  youtube
//
//  Created by jewelz on 2017/2/12.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
  @IBOutlet weak var thumbnailView: UIImageView!
  @IBOutlet weak var profileView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    separatorHeightConstraint.constant = 1 / UIScreen.main.scale
  }
  
}
