//
//  WWSpecs.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

//
//  WWSpecs.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

let iPhone4Height: CGFloat = 480
let iPhone5Height: CGFloat = 568
let smsCountDownSecond: Int = 60
let animationDuration = 0.4
let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height

final class WWSpecs {
    class func windowWidth() -> CGFloat {
        return UIApplication.shared.windows.first?.bounds.width ?? UIScreen.main.bounds.width
    }
    class func windowHeight() -> CGFloat {
        return UIApplication.shared.windows.first?.bounds.height ?? UIScreen.main.bounds.height
    }
    
    /**
     Create an UIColor object based on a CSS color string
     
     :param: hex white as FFFFF
     
     :returns: A new UIColor object
     */
    class func colorFromHex(_ hex: String, alpha: CGFloat) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("0X") || cString.hasPrefix("0x") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        
        //  swiftlint:disable line_length
        let rString = cString.substring(with: cString.startIndex ..< cString.index(cString.startIndex, offsetBy: 2))
        let gString = cString.substring(with: cString.index(cString.startIndex, offsetBy: 2) ..< cString.index(cString.startIndex, offsetBy: 4))
        let bString = cString.substring(with: cString.index(cString.startIndex, offsetBy: 4) ..< cString.index(cString.startIndex, offsetBy: 6))
        
        //  swiftlint:enable line_length
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return  UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    class func overLayColor() -> UIColor {
        return colorFromHex("192F43", alpha: 0.8)
    }
}


