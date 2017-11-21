//
//  WWProfileViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/21.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWProfileViewController: WWTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        UIApplication.shared.statusBarStyle = .lightContent
        WWTool.setStatusBarBackgroundColor(color: wwTheme.fontColor2)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        UIApplication.shared.statusBarStyle = .default
        WWTool.setStatusBarBackgroundColor(color: wwTheme.statusBarOriginalBGColor)
    }
    
    //设置状态栏颜色
    func setStatusBarBackgroundColor() {
        let statusBar = UIView.init(frame: CGRect.init(x: 0, y: 0, width: WWSpecs.windowWidth(), height: 20))
        statusBar.backgroundColor = .black
        self.view.addSubview(statusBar)
    }
    
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 320
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.loadFromNibNamed(nibNamed: "WWProfileHeaderView") as? WWProfileHeaderView
        //        headerView.backgroundColor = .gray
        return headerView!
    }

    

}
