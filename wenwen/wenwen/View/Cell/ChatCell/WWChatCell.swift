//
//  WWChatCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/22.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWChatCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var topLine: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topLine.isHidden = true
        icon.layer.cornerRadius = 4
        icon.layer.masksToBounds = true
    }

    
}
