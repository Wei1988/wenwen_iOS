//
//  WWChatSendCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/23.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWChatSendCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var sendBubbleImageView: UIImageView!
    @IBOutlet weak var sendTextLabel: UILabel!
    @IBOutlet weak var sendContainerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = wwTheme.bgGray2
        sendBubbleImageView.image = UIImage(named: "sendBubble")?.resizableImage(withCapInsets: UIEdgeInsetsMake(30, 10, 10, 20))
        sendContainerView.backgroundColor = .clear
        icon.layer.cornerRadius = 4
        icon.layer.masksToBounds = true
    }

    
    
}
