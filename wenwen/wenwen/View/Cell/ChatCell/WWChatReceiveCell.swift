//
//  WWChatReceiveCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/23.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWChatReceiveCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var receiveTextLabel: UILabel!
    @IBOutlet weak var textContainerView: UIView!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = wwTheme.bgGray2
        bubbleImageView.image = UIImage(named: "receiveBubble")?.stretchableImage(withLeftCapWidth: 20, topCapHeight: 30)
        textContainerView.backgroundColor = .clear
    }

}
