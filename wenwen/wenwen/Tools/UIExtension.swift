//
//  UIExtension.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/20.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}


