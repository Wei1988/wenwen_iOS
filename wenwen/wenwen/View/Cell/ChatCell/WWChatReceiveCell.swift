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

    func addTriangeToTextContainerView() {
//        let layer = WWTool.addLeftTriangleToView(textContainerView)
//        textContainerView.layer.mask = layer
//        textContainerView.layer.addSublayer(layer)
//        textContainerView.layer.masksToBounds = true
       
    }
    
    
    
//    let showView = UIImageView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    
//    showView.image = UIImage(named: "Snip20161312_3")
//    showView.layer.mask = test(showView: showView)
//    self.view.addSubview(showView)
//
    //UIView
//    let blankView = UIView.init(frame: CGRect(x: 250, y: 100, width: 100, height: 100))
    
//    blankView.backgroundColor = UIColor.green
//    blankView.layer.mask = test(showView: blankView)
//    self.view.addSubview(blankView)
    
    
}
