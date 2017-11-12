//
//  CountDownHandler.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import Kingfisher
import SwiftyJSON
import UIKit

typealias CountDownTask = (_ cancel: Bool) -> Void


final class CountDownHandler {
    var remainingSeconds: Int?
    var startTime: Date?
    var countDownTask: CountDownTask?
    
    let totalSeconds: Int = 60
    
    static let shared = CountDownHandler()
    
    // 获取验证码倒计时实现
    func countDown(_ countDownButton: UIButton, _ title: String, _ backgroundColor: UIColor) {
        if countDownButton.isEnabled {
            countDownButton.isEnabled = false
            remainingSeconds = totalSeconds
            startTime = Date().addingTimeInterval(Double(totalSeconds))
            countDownButton.setTitle("\(remainingSeconds!)", for: UIControlState())
            countDownButton.backgroundColor = backgroundColor
            countDownButton.setTitleColor(WWSpecs.colorFromHex("666666", alpha: 1), for: UIControlState())
        } else {
            remainingSeconds = Int(ceil(startTime!.timeIntervalSinceNow))
            if remainingSeconds! < 0 {
                remainingSeconds = 0
            }
            countDownButton.setTitle("\(remainingSeconds!)", for: UIControlState())
            if remainingSeconds == 0 {
                countDownButton.setTitle(title, for: UIControlState())
                countDownButton.isEnabled = true
                countDownButton.backgroundColor = wwTheme.bgColor3
                countDownButton.setTitleColor(WWSpecs.colorFromHex("472B34", alpha: 1), for: UIControlState())
                return
            }
        }
        if countDownTask != nil {
            cancelTask(countDownTask)
        }
        countDownTask = delay(1) { () -> Void in
            self.countDown(countDownButton, title, backgroundColor)
        }
    }
    
    func cancelTask(_ task: CountDownTask?) {
        task?(true)
    }
    
    
    
}
