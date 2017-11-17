//
//  WWHomeTabBarViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWHomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = wwTheme.fontColor2
        
        addChildViewControllers()
    }
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: WWFriendListViewController(), title: "问友", imageName: "wenyou", selectedImage: "wenyou_press")
        addChildViewController(childController: WWCircleViewController(), title: "圈子", imageName: "quanzi", selectedImage: "quanzi_press")
        addChildViewController(childController: WWChatViewController(), title: "消息", imageName: "xiaoxi", selectedImage: "xiaoxi_press")
        addChildViewController(childController: WWOverseaTreatmentViewController(), title: "出国就诊", imageName: "chuguo", selectedImage: "chuguo_press")
        addChildViewController(childController: WWMeViewController(), title: "我", imageName: "me", selectedImage: "me_press")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImage: String) {
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        childController.title = title
        let navC = WWNavigationController(rootViewController: childController)
        navC.navigationItem.title = title
        addChildViewController(navC)
    }

    
}
