//
//  WWArticleReplyCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/28.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWArticleReplyCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var replyView: UIView!
    
    @IBOutlet weak var replayNameOne: UILabel!
    @IBOutlet weak var replyOneTextLabel: UILabel!
    
    
    @IBOutlet weak var replyNameTwo: UILabel!
    @IBOutlet weak var replyTwoTextLabel: UILabel!
    
    @IBOutlet weak var replyViewheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 18
        icon.layer.masksToBounds = true
        
    }

   
}
