//
//  WWCommunityTableViewCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/20.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWCommunityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImageView.layer.cornerRadius = 4
        iconImageView.layer.masksToBounds = true
    }

    
}
