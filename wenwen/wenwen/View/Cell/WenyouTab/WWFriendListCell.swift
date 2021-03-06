//
//  WWFriendListCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/18.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWFriendListCell: UITableViewCell {
    
    @IBOutlet weak var topDividerLine: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    @IBOutlet weak var tagLeftView: UIView!
    @IBOutlet weak var tagLeftLabel: UILabel!
    @IBOutlet weak var tagRightView: UIView!
    @IBOutlet weak var tagRightLabel: UILabel!
    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        iconImageView.layer.cornerRadius = 4
        iconImageView.layer.masksToBounds = true
        
        topDividerLine.isHidden = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = wwTheme.fontColor4
        genderView.layer.cornerRadius = 7.5
        genderView.layer.masksToBounds = true
        ageView.layer.cornerRadius = 7.5
        ageView.layer.masksToBounds = true
        ageLabel.textColor = UIColor.white
        locationLabel.font = UIFont.systemFont(ofSize: 13)
        locationLabel.textColor = wwTheme.fontColor1
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.textColor = wwTheme.fontColor1
        descLabel.numberOfLines = 2
        tagLeftView.layer.borderWidth = 1
        tagLeftView.layer.borderColor = wwTheme.fontColor1.cgColor
        tagLeftView.layer.cornerRadius = 5
        tagLeftView.layer.masksToBounds = true
        tagLeftLabel.textColor = wwTheme.fontColor1
        tagRightView.layer.borderWidth = 1
        tagRightView.layer.borderColor = wwTheme.fontColor1.cgColor
        tagRightView.layer.cornerRadius = 5
        tagRightView.layer.masksToBounds = true
        tagRightLabel.textColor = wwTheme.fontColor1
    }
   
    
}
