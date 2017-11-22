//
//  WWProfileHeaderView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/21.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

protocol ProfileDetailHeaderDelegate: NSObjectProtocol {
    func recentTabClicked()
    func popularTabClicked()
    func communityTabClicked()
    func backButtonClicked()
}

final class WWProfileHeaderView: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var recentContainerView: UIView!
    @IBOutlet weak var recentLabel: UILabel!
    @IBOutlet weak var recentBottomLine: UIView!
    
    
    @IBOutlet weak var popularContainerView: UIView!
    @IBOutlet weak var popularLabel: UILabel!
    @IBOutlet weak var popularBottomLine: UIView!
    
    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var communityBottomLine: UIView!
    @IBOutlet weak var communityContainerView: UIView!
    
    weak var delegate: ProfileDetailHeaderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        icon.layer.cornerRadius = 30
        icon.layer.masksToBounds = true
        gradeView.layer.cornerRadius = 3
        gradeView.layer.masksToBounds = true
        
        recentLabel.textColor = wwTheme.fontColor2
        recentBottomLine.isHidden = false
        popularBottomLine.isHidden = true
        communityBottomLine.isHidden = true
        addTapGestures()
    }
    
    func addTapGestures() {
        let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(recentTabClicked))
        recentContainerView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(popularTabClicked))
        popularContainerView.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer.init(target: self, action: #selector(communityTabClicked))
        communityContainerView.addGestureRecognizer(tap3)
        
    }
    
    @objc func recentTabClicked() {
        setLabelColors(true, false, false, false)
        self.delegate?.recentTabClicked()
    }
    
    @objc func popularTabClicked() {
        setLabelColors(false, true, false, false)
        self.delegate?.popularTabClicked()
    }
    
    @objc func communityTabClicked() {
        setLabelColors(false, false, true, false)
        self.delegate?.communityTabClicked()
    }
    
    @IBAction func backButtonClicked() {
        self.delegate?.backButtonClicked()
    }
    
    func setLabelColors(_ recentTabClicked: Bool, _ popularTabClicked: Bool, _ mvpTabClicked: Bool, _ rankTabClicked: Bool) {
        recentLabel.textColor = recentTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        popularLabel.textColor = popularTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        communityLabel.textColor = mvpTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        
        recentBottomLine.isHidden = recentTabClicked ? false : true
        popularBottomLine.isHidden = popularTabClicked ? false : true
        communityBottomLine.isHidden = mvpTabClicked ? false : true
    }
}
