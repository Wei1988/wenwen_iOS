//
//  CommunityDetailHeaderView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/20.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

protocol CommunityDetailHeaderDelegate: NSObjectProtocol {
    func mostRecentTabClicked()
    func mostPopularTabClicked()
    func mvpTabClicked()
    func rankTabClicked()
    func postArticleBtnClicked()
}

class CommunityDetailHeaderView: UIView {
    
    @IBOutlet weak var communityIcon: UIImageView!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var articleCountLabel: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var managerOneIcon: UIImageView!
    @IBOutlet weak var managerTwoIcon: UIImageView!
    @IBOutlet weak var managerThreeIcon: UIImageView!
    
    @IBOutlet weak var publishArticleButton: UIButton!
    
    @IBOutlet weak var mostRecentTabLabel: UILabel!
    @IBOutlet weak var mostPopularTabLabel: UILabel!
    @IBOutlet weak var mvpTabLabel: UILabel!
    @IBOutlet weak var rankTabLabel: UILabel!
    
    @IBOutlet weak var mostRecentTabView: UIView!
    @IBOutlet weak var mostPopularTabView: UIView!
    @IBOutlet weak var mvpTabView: UIView!
    @IBOutlet weak var rankTabView: UIView!
    
    @IBOutlet weak var recentTabBottomLine: UIView!
    @IBOutlet weak var popularTabBottomLine: UIView!
    @IBOutlet weak var mvpTabBottomLine: UIView!
    @IBOutlet weak var rankTabBottomLine: UIView!
    
    
    
    weak var delegate: CommunityDetailHeaderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        addTapGestures()
    }
    
    func setup() {
        joinButton.layer.borderColor = wwTheme.fontColor2.cgColor
        joinButton.layer.borderWidth = 1
        joinButton.layer.cornerRadius = 12
        joinButton.layer.masksToBounds = true
        
        communityIcon.layer.cornerRadius = 4
        communityIcon.layer.masksToBounds = true 
        
        publishArticleButton.layer.borderWidth = 1
        publishArticleButton.layer.borderColor = wwTheme.fontColor2.cgColor
        publishArticleButton.layer.cornerRadius = 5
        publishArticleButton.layer.masksToBounds = true
        
        mostRecentTabLabel.textColor = wwTheme.fontColor2
        recentTabBottomLine.isHidden = false
        popularTabBottomLine.isHidden = true
        mvpTabBottomLine.isHidden = true
        rankTabBottomLine.isHidden = true
        
        managerOneIcon.layer.cornerRadius = 12.5
        managerOneIcon.layer.masksToBounds = true
        managerTwoIcon.layer.cornerRadius = 12.5
        managerTwoIcon.layer.masksToBounds = true
        managerThreeIcon.layer.cornerRadius = 12.5
        managerThreeIcon.layer.masksToBounds = true
    }
    
    func addTapGestures() {
        let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(recentTabClicked))
        mostRecentTabView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(popularTabClicked))
        mostPopularTabView.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer.init(target: self, action: #selector(mvpTabClicked))
        mvpTabView.addGestureRecognizer(tap3)
        let tap4 = UITapGestureRecognizer.init(target: self, action: #selector(rankTabClicked))
        rankTabView.addGestureRecognizer(tap4)
    }
    
    @IBAction func postArticleBtnClicked(_ sender: Any) {
        self.delegate?.postArticleBtnClicked()
    }
    
    @objc func recentTabClicked() {
        setLabelColors(true, false, false, false)
        self.delegate?.mostRecentTabClicked()
    }
    
    @objc func popularTabClicked() {
        setLabelColors(false, true, false, false)
        self.delegate?.mostPopularTabClicked()
    }
    
    @objc func mvpTabClicked() {
        setLabelColors(false, false, true, false)
        self.delegate?.mvpTabClicked()
    }
    
    @objc func rankTabClicked() {
        setLabelColors(false, false, false, true)
        self.delegate?.rankTabClicked()
    }
    
    func setLabelColors(_ recentTabClicked: Bool, _ popularTabClicked: Bool, _ mvpTabClicked: Bool, _ rankTabClicked: Bool) {
        mostRecentTabLabel.textColor = recentTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        mostPopularTabLabel.textColor = popularTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        mvpTabLabel.textColor = mvpTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        rankTabLabel.textColor = rankTabClicked ? wwTheme.fontColor2 : wwTheme.fontColor4
        
        recentTabBottomLine.isHidden = recentTabClicked ? false : true
        popularTabBottomLine.isHidden = popularTabClicked ? false : true
        mvpTabBottomLine.isHidden = mvpTabClicked ? false : true
        rankTabBottomLine.isHidden = rankTabClicked ? false : true
        
    }

}
