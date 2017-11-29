//
//  WWCommunityDetailCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/21.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWCommunityDetailCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var folllowBtn: UIButton!
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleTextLabel: UILabel!
    
    @IBOutlet weak var thumbCountLabel: UILabel!
    @IBOutlet weak var messageCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    func setup() {
        folllowBtn.layer.cornerRadius = 12
        folllowBtn.layer.borderColor = wwTheme.fontColor2.cgColor
        folllowBtn.layer.borderWidth = 1
        folllowBtn.layer.masksToBounds = true
        icon.layer.cornerRadius = 4
        icon.layer.masksToBounds = true
        
    }
    
}
