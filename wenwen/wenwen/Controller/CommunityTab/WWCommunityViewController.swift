//
//  WWCircleViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWCommunityViewController: WWTableViewController {
    
    var data = [[String: String]]()
    var footerData = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
        ]
        configRightBarItem()
        registerCell()
        setData()
    }
    
    func configRightBarItem() {
        let button = UIButton()
        button.setTitle("创建圈子", for: UIControlState())
        button.setTitleColor(wwTheme.fontColor2, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.frame.size.width = 30
        //        button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWCommunityTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWCommunityTableViewCell.self))
    }
    
    func setData() {
        data = [
            [
                "icon": "splash",
                "name": "抗癌小分队",
                "desc": "抗癌心得，生活感悟，在这里释放你的心情"
            ],
            [
                "icon": "splash",
                "name": "关爱白血病人",
                "desc": "发起募捐，献爱心，寻找好的心灵慰藉"
            ],
            [
                "icon": "splash",
                "name": "新人报到",
                "desc": "欢迎加入问问大家庭"
            ]
        ]
        footerData = [
            [
                "icon": "splash",
                "name": "我来说故事",
                "desc": "说说你在抗癌过程中的一二三"
            ],
            [
                "icon": "splash",
                "name": "好玩嗨站",
                "desc": "属于千万病友休闲娱乐的小圈子"
            ],
            [
                "icon": "splash",
                "name": "热门精选",
                "desc": "网络热门主题，精选内容"
            ],
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWCommunityTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWCommunityTableViewCell, self.data[indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWCommunityTableViewCell, _ dict: [String: String]) {
        cell.iconImageView.image = UIImage(named: dict["icon"] ?? "")
        cell.nameLabel.text = dict["name"] ?? ""
        cell.descLabel.text = dict["desc"] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WWCommunityDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(headerView.snp.left).offset(15)
            make.bottom.equalTo(headerView.snp.bottom)
            make.top.equalTo(headerView.snp.top).offset(5)
            make.right.equalTo(headerView.snp.right)
        }
        label.text = "我关注的"
        label.textColor = wwTheme.fontColor4
        label.font = UIFont.systemFont(ofSize: 14)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    // footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.loadFromNibNamed(nibNamed: "WWCommunityFooterView") as? WWCommunityFooterView
        configureFooterViewWithJSON(footerView!, footerData)
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 320
    }
    
    func configureFooterViewWithJSON(_ footerView: WWCommunityFooterView, _ data: [[String: String]]) {
        footerView.topIcon.image = UIImage(named: data[0]["icon"] ?? "")
        footerView.topNameLabel.text = data[0]["name"] ?? ""
        footerView.topDescLabel.text = data[0]["desc"] ?? ""
        
        footerView.middleIcon.image = UIImage(named: data[1]["icon"] ?? "")
        footerView.middleNameLabel.text = data[1]["name"] ?? ""
        footerView.middleDescLabel.text = data[1]["desc"] ?? ""
        
        footerView.bottomIcon.image = UIImage(named: data[2]["icon"] ?? "")
        footerView.bottomNameLabel.text = data[2]["name"] ?? ""
        footerView.bottomDescLabel.text = data[2]["desc"] ?? ""
        
    }
    
}
