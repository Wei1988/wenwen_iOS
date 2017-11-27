//
//  WWCommunityDetailViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/20.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWCommunityDetailViewController: WWTableViewController, CommunityDetailHeaderDelegate {
    func mostRecentTabClicked() {
        
    }
    
    func mostPopularTabClicked() {
        
    }
    
    func mvpTabClicked() {
        
    }
    
    func rankTabClicked() {
        
    }
    
    func postArticleBtnClicked() {
        let vc = WWPostArticleViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var data = [[String: String]]()
    var headerData = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "全部帖子"
        configRightBarItem()
        registerCell()
        setData()
    }
    
    func configRightBarItem() {
        let button = UIButton()
//        button.setTitle("创建圈子", for: UIControlState())
        button.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        button.setTitleColor(wwTheme.fontColor2, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.frame.size.width = 30
        //        button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWCommunityDetailCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWCommunityDetailCell.self))
    }
    
    func setData() {
        data = [
            [
                "icon": "splash",
                "name": "流年",
                "time": "30分钟前",
                "articleTitle": "男人癌在美国，五年生存率竟超90%",
                "articleText": "随着我国居民生活水平的逐步提高和人口老龄化的加速，前列腺癌已经成为男性常见恶性肿瘤，发病率以每年10%的速度增长。目前，前列腺癌发病具体原因尚不明确，除了家族遗传因素",
                "thumbCount": "200",
                "messageCount": "10"
            ],
            [
                "icon": "splash",
                "name": "James",
                "time": "2小时前",
                "articleTitle": "国内看病难，美国为什么没有这种担忧",
                "articleText": "大洋彼岸的美国，拥有世界上最好的医疗资源。享受着 美国医院 丰富医疗资源的美国人，从没有像中国患者这样为看病难头疼。 国内医疗资源分配不公 看病只愿去大医院 相对美国，",
                "thumbCount": "100",
                "messageCount": "26"
            ],
            [
                "icon": "splash",
                "name": "隔壁老王",
                "time": "2017-11-18",
                "articleTitle": "德国看病：体验享受式医疗",
                "articleText": "最近，德国最引人瞩目的新闻就是默克尔又赢得了选举，将开启她的第四次总理任期。过去12年，德国在她的领导下，在政治、外交、经济上都取得了不俗的成绩。作为欧洲最大的国民",
                "thumbCount": "11",
                "messageCount": "5"
            ]
        ]
        headerData = [
                "icon": "splash",
                "memberCount": "2万",
                "articleCount": "1000",
                "managerOneIcon": "splash",
                "managerTwoIcon": "splash",
                "managerThreeIcon": "splash"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWCommunityDetailCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWCommunityDetailCell, self.data[indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWCommunityDetailCell, _ dict: [String: String]) {
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
        cell.nameLabel.text = dict["name"] ?? ""
        cell.timeLabel.text = dict["time"] ?? ""
        cell.articleTitleLabel.text = dict["articleTitle"] ?? ""
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        style.lineBreakMode = .byTruncatingTail
        cell.articleTextLabel.numberOfLines = 0
        cell.articleTextLabel.attributedText = NSAttributedString.init(string: dict["articleText"] ?? "", attributes: [
            NSAttributedStringKey.foregroundColor : wwTheme.fontColor1,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.paragraphStyle: style
            ])
        
        cell.thumbCountLabel.text = dict["thumbCount"] ?? ""
        cell.messageCountLabel.text = dict["messageCount"] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }

    // header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView.loadFromNibNamed(nibNamed: "CommunityDetailHeaderView") as? CommunityDetailHeaderView
        configureHeaderViewWithJSON(header!, headerData)
        header?.delegate = self
        return header!
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 270
    }
    
    func configureHeaderViewWithJSON(_ header: CommunityDetailHeaderView, _ data: [String: String]) {
        header.communityIcon.image = UIImage(named: data["icon"] ?? "")
        header.memberCountLabel.text = data["memberCount"] ?? ""
        header.articleCountLabel.text = data["articleCount"] ?? ""
        header.managerOneIcon.image = UIImage(named: data["managerOneIcon"] ?? "")
        header.managerTwoIcon.image = UIImage(named: data["managerTwoIcon"] ?? "")
        header.managerThreeIcon.image = UIImage(named: data["managerThreeIcon"] ?? "")
        
    }

}
