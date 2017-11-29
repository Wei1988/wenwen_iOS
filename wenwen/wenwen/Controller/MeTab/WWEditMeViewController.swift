//
//  WWEditMeViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/29.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWEditMeViewController: WWTableViewController {

    var data = [[[String: String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
        ]
        self.title = "个人信息"
        setData()
        registerCell()
    }
    
        func setData() {
            data = [
                [
                    [
                        "title": "头像",
                        "icon": "splash",
                        "desc": ""
                    ],
                    [
                        "title": "昵称",
                        "desc": "小明"
                    ],
                    [
                        "title": "性别",
                        "desc": "女"
                    ],
                    [
                        "title": "生日",
                        "desc": ""
                    ]
                ],
                [
                    [
                        "title": "身份",
                        "desc": "病友"
                    ],
                    [
                        "title": "患病类型",
                        "desc": "癌症"
                    ],
                    [
                        "title": "标签",
                        "desc": ""
                    ],
                    [
                        "title": "所在城市",
                        "desc": "北京"
                    ],
                    [
                        "title": "签名",
                        "desc": "先定一个小目标"
                    ]
                ]
            ]
        }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWMeCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWMeCell.self))
        self.tableView.register(UINib(nibName: String(describing: WWMeImageCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWMeImageCell.self))
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
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WWMeImageCell", for: indexPath)
            cell.selectionStyle = .none
            configCellWithJSON(cell as! WWMeImageCell, self.data[indexPath.section][indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WWMeCell", for: indexPath)
            cell.selectionStyle = .none
            configCellWithJSON(cell as! WWMeCell, self.data[indexPath.section][indexPath.row])
            return cell
        }
        
    }
    
    func configCellWithJSON(_ cell: WWMeCell, _ dict: [String: String]) {
        cell.titleLabel.text = dict["title"] ?? ""
        cell.contentLabel.text = dict["desc"] ?? ""
    }
    
    func configCellWithJSON(_ cell: WWMeImageCell, _ dict: [String: String]) {
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 70
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 20
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
   
    

}
