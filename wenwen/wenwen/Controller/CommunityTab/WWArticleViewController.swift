//
//  WWArticleViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/27.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWArticleViewController: WWTableViewController {
    
    var userName: String?
    var data = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.title = userName
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100
        setData()
    }
    
    func setData() {
        data = [
            [
                "icon": "splash",
                "name": "抗癌小分队",
                "date": "1小时前",
                "floor": "1楼",
                "desc": "例如下面这位60岁的急性粒细胞白血病患者，他于2015年5月至2016年7月间多次到美国最好的癌症中心接受治疗"
            ],
            [
                "icon": "splash",
                "name": "关爱白血病人",
                "date": "2017-11-27",
                "floor": "2楼",
                "desc": "需要注意的是，参加“出国看病控费计划”的患者，在不同的美国医院可享受的折扣并不相同，同一医院的不同检查、治疗、药品，折扣也有所差异。",
            ]
        ]
    }

    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWArticleCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWArticleCell.self))
        self.tableView.register(UINib(nibName: String(describing: WWArticleReplyCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWArticleReplyCell.self))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 1 : data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WWArticleCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WWArticleReplyCell", for: indexPath)
            cell.selectionStyle = .none
            configCellWithJSON(cell as! WWArticleReplyCell, self.data[indexPath.row])
            if indexPath.row == 0 {
                (cell as! WWArticleReplyCell).replyView.isHidden = true
                (cell as! WWArticleReplyCell).replyViewheightConstraint.constant = 0
                (cell as! WWArticleReplyCell).bottomContraint.constant = 0
            }
            return cell
        }
        
    }
    
    func configCellWithJSON(_ cell: WWArticleReplyCell, _ dict: [String: String]) {
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
        cell.floorLabel.text = dict["floor"] ?? ""
        cell.name.text = dict["name"] ?? ""
        cell.dateLabel.text = dict["date"] ?? ""
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        style.alignment = .justified
        cell.descLabel.attributedText = NSAttributedString(string: dict["desc"] ?? "", attributes: [
            NSAttributedStringKey.foregroundColor : wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.paragraphStyle: style
            ])
        
        
    }
    
    // header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .white
        if section == 0 {
            // label
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(titleLabel)
            titleLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(header.snp.left).offset(20)
                make.right.equalTo(header.snp.right).offset(-16)
                make.top.equalTo(header.snp.top).offset(20)
            })
            titleLabel.numberOfLines = 0
            titleLabel.text = "大家一起来谈谈大家对癌症的看法"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            titleLabel.textColor = wwTheme.fontColor4
            
            let dateLabel = UILabel()
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(dateLabel)
            dateLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(titleLabel.snp.left)
                make.top.equalTo(titleLabel.snp.bottom).offset(6)
            })
            dateLabel.text = "2017-11-10"
            dateLabel.textColor = wwTheme.fontColor1
            dateLabel.font = UIFont.systemFont(ofSize: 14)
            
            let communityBtn = UIButton()
            communityBtn.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(communityBtn)
            communityBtn.snp.makeConstraints({ (make) in
                make.centerY.equalTo(dateLabel.snp.centerY)
                make.left.equalTo(dateLabel.snp.right).offset(20)
            })
            communityBtn.setTitle("癌症圈子", for: UIControlState())
            communityBtn.setTitleColor(wwTheme.fontColor2, for: UIControlState())
            communityBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
        } else {
            let dividerView = UIView()
            dividerView.backgroundColor = wwTheme.fontColor2
            dividerView.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(dividerView)
            dividerView.snp.makeConstraints({ (make) in
                make.left.equalTo(header.snp.left).offset(20)
                make.width.equalTo(2)
                make.centerY.equalTo(header.snp.centerY)
                make.height.equalTo(22)
            })
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(label)
            label.snp.makeConstraints({ (make) in
                make.centerY.equalTo(header.snp.centerY)
                make.left.equalTo(dividerView.snp.right).offset(10)
            })
            label.text = "帖子留言(20)"
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.textColor = wwTheme.fontColor4
            let bottomLine = UIView()
            bottomLine.translatesAutoresizingMaskIntoConstraints = false
            header.addSubview(bottomLine)
            bottomLine.snp.makeConstraints({ (make) in
                make.left.equalTo(header.snp.left)
                make.right.equalTo(header.snp.right)
                make.bottom.equalTo(header.snp.bottom)
                make.height.equalTo(1)
            })
            bottomLine.backgroundColor = wwTheme.borderColor1
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 80 : 45
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 186 : 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footerView = UIView.loadFromNibNamed(nibNamed: "WWArticleFooterView") as? WWArticleFooterView
            return footerView
        } else {
            return nil
        }
        
    }

}
