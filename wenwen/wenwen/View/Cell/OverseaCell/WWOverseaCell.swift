//
//  WWOverseaCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/29.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWOverseaCell: UITableViewCell {
    
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var imageviewTwo: UIImageView!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var labelFour: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewOne.isHidden = true
        labelOne.isHidden = true
        imageviewTwo.isHidden = true
        labelTwo.isHidden = true
        imageViewThree.isHidden = true
        labelThree.isHidden = true
        imageViewFour.isHidden = true
        labelFour.isHidden = true
    }
    
    
}
