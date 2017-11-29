//
//  WWMeHeaderView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/28.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWMeHeaderView: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var levelView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        levelView.layer.cornerRadius = 2
        levelView.layer.masksToBounds = true
    }

}
