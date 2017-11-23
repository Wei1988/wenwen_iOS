//
//  WWTool.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/21.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import Foundation
import UIKit

final class WWTool {
    ///设置状态栏背景颜色
    class func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        /*
         if statusBar.responds(to:Selector("setBackgroundColor:")) {
         statusBar.backgroundColor = color
         }*/
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }

}
