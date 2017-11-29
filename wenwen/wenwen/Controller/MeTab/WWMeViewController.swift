//
//  WWMeViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWMeViewController: WWTableViewController, WWMeHeaderDelegate {
    
    func viewSelected() {
        let vc = WWEditMeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var data = [[[String: String]]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
        ]
        setData()
        registerCell()
    }
    
    func setData() {
        data = [
            [
                [
                    "title": "最近浏览的帖子",
                    "icon": "liulan"
                ],
                [
                    "title": "发布的帖子",
                    "icon": "fabutiezi"
                ],
                [
                    "title": "回复的帖子",
                    "icon": "huifu"
                ]
            ],
            [
                [
                    "title": "最近来访",
                    "icon": "laifang"
                ],
                [
                    "title": "黑名单",
                    "icon": "heimingdan"
                ]
            ]
        ]
    }
    


    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWMeProfileCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWMeProfileCell.self))
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.data[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWMeProfileCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWMeProfileCell, self.data[indexPath.section][indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWMeProfileCell, _ dict: [String: String]) {
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
        cell.titleLabel.text = dict["title"] ?? ""
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView.loadFromNibNamed(nibNamed: "WWMeHeaderView") as? WWMeHeaderView
            headerView?.delegate = self
            return headerView
        } else {
            return nil
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return
            section == 0 ? 136 : 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            let footerView = UIView()
            let bottomButton = UIButton()
            bottomButton.translatesAutoresizingMaskIntoConstraints = false
            footerView.addSubview(bottomButton)
            bottomButton.snp.makeConstraints({ (make) in
                make.left.equalTo(footerView.snp.left).offset(14)
                make.right.equalTo(footerView.snp.right).offset(-14)
                make.height.equalTo(46)
                make.top.equalTo(footerView.snp.top).offset(74)
            })
            bottomButton.setTitle("退出登录", for: UIControlState())
            bottomButton.setTitleColor(UIColor.white, for: UIControlState())
            bottomButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            bottomButton.backgroundColor = wwTheme.fontColor2
            bottomButton.layer.cornerRadius = 5
            bottomButton.layer.masksToBounds = true
            return footerView
        } else {
            return nil
        }
    }

}
