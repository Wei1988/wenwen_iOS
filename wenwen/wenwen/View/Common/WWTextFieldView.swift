//
//  WWTextFieldView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class WWTextFieldView: UIView {
    // constants
    let iconWidth: CGFloat = 10
    let iconHeight: CGFloat = 18
    // properties
    var textFieldRightConstraint: Constraint?
    // UI Items
    let iconView = UIImageView()
    let textfield = UITextField()
    let rightArrowView = UIImageView()
    
    convenience init(_ hasRightArrow: Bool) {
        self.init()
        self.layer.borderWidth = 1
        self.layer.borderColor = wwTheme.fontColor1.cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        setupAndLayout(hasRightArrow)
    }
    
    func setupAndLayout(_ hasRightArrow: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        // icon
        iconView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.width.equalTo(iconWidth)
            make.height.equalTo(iconHeight)
            make.left.equalTo(self.snp.left).offset(11)
            make.top.equalTo(self.snp.top).offset(14)
        }
        iconView.contentMode = .scaleAspectFit
        // text field
        textfield.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfield)
        textfield.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(12)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
            textFieldRightConstraint = make.right.equalTo(self.snp.right).constraint
        }
        textfield.clearButtonMode = .whileEditing
        // right arrow
        if !hasRightArrow {
            return
        }
        rightArrowView.image = UIImage(named: "back_button")
        rightArrowView.contentMode = .scaleAspectFit
        self.addSubview(rightArrowView)
        rightArrowView.snp.makeConstraints { (make) in
            make.width.equalTo(iconWidth)
            make.height.equalTo(iconHeight)
            make.right.equalTo(self.snp.right).offset(-10)
            make.centerY.equalTo(self.snp.centerY)
        }
        textFieldRightConstraint?.update(offset: -iconWidth-8)
        textfield.clearButtonMode = .never
    }
}
