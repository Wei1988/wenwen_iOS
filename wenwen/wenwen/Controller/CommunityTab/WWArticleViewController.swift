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

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.title = userName
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100
    }

    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWArticleCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWArticleCell.self))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return section == 0 ? 1 : 5
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWArticleCell", for: indexPath)
        cell.selectionStyle = .none
//        configCellWithJSON(cell as! WWArticleCell, self.data[indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWArticleCell, _ dict: [String: String]) {
//        cell.iconImageView.image = UIImage(named: dict["icon"] ?? "")
//        cell.nameLabel.text = dict["name"] ?? ""
//        cell.descLabel.text = dict["desc"] ?? ""
    }
    

}
