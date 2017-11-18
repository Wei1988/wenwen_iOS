//
//  CarouselView.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/18.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

final class CarouselView: UIView {
    
    // UI Items
    let imageView = UIImageView()
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func setup() {
        
        // imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
//            make.left.equalTo(self.snp.left)
//            make.right.equalTo(self.snp.right)
            
            make.width.height.equalTo(WWSpecs.windowWidth()/3-20)
//            make.width.height.equalTo(self.frame.height*0.7)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
        label.textAlignment = .center
        label.textColor = wwTheme.fontColor7
        // corner raidus
        let corner = UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: UIRectCorner(rawValue: corner), cornerRadii: CGSize.init(width: self.frame.width/2, height: self.frame.width/2))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
    }
    
}
