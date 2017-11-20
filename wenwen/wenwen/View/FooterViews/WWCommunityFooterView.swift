//
//  WWCommunityFooterView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/20.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWCommunityFooterView: UIView {
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var topIcon: UIImageView!
    @IBOutlet weak var topNameLabel: UILabel!
    @IBOutlet weak var topDescLabel: UILabel!
    
    @IBOutlet weak var middleIcon: UIImageView!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var middleDescLabel: UILabel!
    
    @IBOutlet weak var bottomIcon: UIImageView!
    @IBOutlet weak var bottomNameLabel: UILabel!
    @IBOutlet weak var bottomDescLabel: UILabel!
    
    @IBOutlet weak var topJoinButton: UIButton!
    @IBOutlet weak var middleJoinButton: UIButton!
    @IBOutlet weak var bottomJoinButton: UIButton!
    
    @IBOutlet weak var moreCommunityButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    func setup() {
        refreshButton.layer.borderColor = wwTheme.borderColor1.cgColor
        refreshButton.layer.borderWidth = 1
        refreshButton.layer.cornerRadius = 10
        refreshButton.layer.masksToBounds = true
        addBorderForJoinButton(topJoinButton)
        addBorderForJoinButton(middleJoinButton)
        addBorderForJoinButton(bottomJoinButton)
        
        moreCommunityButton.layer.borderWidth = 1
        moreCommunityButton.layer.borderColor = wwTheme.borderColor1.cgColor
        moreCommunityButton.layer.cornerRadius = 5
        moreCommunityButton.layer.masksToBounds = true
    }
    
    func addBorderForJoinButton(_ btn: UIButton) {
        btn.layer.borderWidth = 1
        btn.layer.borderColor = wwTheme.fontColor2.cgColor
    }

}
