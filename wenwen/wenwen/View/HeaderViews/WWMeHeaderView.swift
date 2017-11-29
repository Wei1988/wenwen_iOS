//
//  WWMeHeaderView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/28.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

protocol WWMeHeaderDelegate: NSObjectProtocol {
    func viewSelected()
}


class WWMeHeaderView: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var levelView: UIView!
    
    @IBOutlet weak var meView: UIView!
    
    weak var delegate: WWMeHeaderDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        levelView.layer.cornerRadius = 2
        levelView.layer.masksToBounds = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(meViewTapped))
        meView.addGestureRecognizer(tapGesture)
        icon.layer.cornerRadius = 4
        icon.layer.masksToBounds = true
    }
    
    @objc func meViewTapped() {
        self.delegate?.viewSelected()
    }
    

}
