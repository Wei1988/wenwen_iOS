//
//  WWOverseaTreatmentViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWOverseaTreatmentViewController: WWTableViewController {
    
    var data = [[[String: String]]]()
    var headerData = [String]()
    
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
                    "title": "德国就医",
                    "icon": "德国就医",
                ],
                [
                    "title": "美国就医",
                    "icon": "美国就医"
                ],
                [
                    "title": "日本就医",
                    "icon": "日本就医"
                ],
                [
                    "title": "新加坡就医",
                    "icon": "新加坡就医"
                ]
            ],
            [
                [
                    "title": "日本体检",
                    "icon": "日本体检"
                ],
            ],
            [
                [
                    "title": "韩国整容",
                    "icon": "韩国整容"
                ],
            ],
            
        ]
        headerData = [
            "出国就诊",
        "出国体检",
        "海外整容"
        
        ]
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWOverseaCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWOverseaCell.self))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return headerData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWOverseaCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWOverseaCell, self.data[indexPath.section])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWOverseaCell, _ dict: [[String: String]]) {
        for i in 0..<dict.count {
            if i == 0 {
                cell.imageViewOne.image = UIImage(named: dict[i]["icon"] ?? "")
                cell.labelOne.text = dict[i]["title"] ?? ""
                cell.imageViewOne.isHidden = false
                cell.labelOne.isHidden = false
            } else if i == 1 {
                cell.imageviewTwo.image = UIImage(named: dict[i]["icon"] ?? "")
                cell.labelTwo.text = dict[i]["title"] ?? ""
                cell.imageviewTwo.isHidden = false
                cell.labelTwo.isHidden = false
            } else if i == 2 {
                cell.imageViewThree.image = UIImage(named: dict[i]["icon"] ?? "")
                cell.labelThree.text = dict[i]["title"] ?? ""
                cell.imageViewThree.isHidden = false
                cell.labelThree.isHidden = false
            } else if i == 3 {
                cell.imageViewFour.image = UIImage(named: dict[i]["icon"] ?? "")
                cell.labelFour.text = dict[i]["title"] ?? ""
                cell.imageViewFour.isHidden = false
                cell.labelFour.isHidden = false
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(header.snp.left).offset(14)
            make.bottom.equalTo(header.snp.bottom).offset(-8)
        }
        label.textColor = wwTheme.fontColor4
        label.text = headerData[section]
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return header
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

}
