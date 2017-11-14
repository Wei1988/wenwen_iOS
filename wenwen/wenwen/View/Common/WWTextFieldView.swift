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
    
    convenience init(_ hasRightArrow: Bool) {
        self.init()
        self.layer.borderWidth = 1
        self.layer.borderColor = wwTheme.fontColor1.cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        setupAndLayout()
    }
    
    func setupAndLayout() {
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
    }
}
