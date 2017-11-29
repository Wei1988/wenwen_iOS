//
//  WWChatViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWChatViewController: WWTableViewController {
    
    var data = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
        ]
        registerCell()
        setData()
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWChatCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWChatCell.self))
    }
    
    func setData() {
        data = [
            [
                "icon": "nan1",
                "name": "壁虎漫步",
                "desc": "抗癌心得，生活感悟，在这里释放你的心情",
                "time": "30分钟前"
            ],
            [
                "icon": "nv2",
                "name": "我相信",
                "desc": "发起募捐，献爱心，寻找好的心灵慰藉",
                "time": "昨天"
            ],
            [
                "icon": "nv3",
                "name": "一剪梅",
                "desc": "欢迎加入问问大家庭",
                "time": "2017-11-10"
            ]
        ]
    }

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWChatCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWChatCell, self.data[indexPath.row])
        if indexPath.row == 0 {
            (cell as! WWChatCell).topLine.isHidden = false
        }
        return cell
    }
    
    func configCellWithJSON(_ cell: WWChatCell, _ dict: [String: String]) {
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
        cell.nameLabel.text = dict["name"] ?? ""
        cell.descLabel.text = dict["desc"] ?? ""
        cell.timeLabel.text = dict["time"] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WWConversationViewController()
        vc.titleString = data[indexPath.row]["name"] ?? ""
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}
