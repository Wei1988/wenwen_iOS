//
//  WWProfileViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/21.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWProfileViewController: WWTableViewController, ProfileDetailHeaderDelegate {
    
    let bottomView = UIView()
    
    func recentTabClicked() {
        
    }
    
    func popularTabClicked() {
        
    }
    
    func communityTabClicked() {
        
    }
    
    func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    var iconName: String?
    var data = [[String: String]]()
    var headerData = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .top
        self.view.backgroundColor = .white
        registerCell()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        UIApplication.shared.statusBarStyle = .lightContent
        WWTool.setStatusBarBackgroundColor(color: wwTheme.fontColor2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        UIApplication.shared.statusBarStyle = .default
        WWTool.setStatusBarBackgroundColor(color: wwTheme.statusBarOriginalBGColor)
        removeBottomView()
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWProfileCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWProfileCell.self))
    }
    
    func setData() {
        data = [
            [
                "title": "日本就医强项——胰腺癌治疗篇",
                "text": "手术切除是胰腺癌患者获得最好效果的治疗方法，然而，超过80%的胰腺癌患者因病期较晚而失去手术机会，同时由于全身化疗患者反应较大，介入治疗通过将导管（由大腿根部插管）插至肿瘤供血动脉提高肿瘤局部的药物浓度，减少全身不良反应。",
                "readCount": "300",
                "community": "癌症圈子",
                "time": "次阅读 | 30分钟前"
            ],
            [
                "title": "为什么说去东京看病比北京、上海更方便？",
                "text": "的确，与病魔抗争的过程，选择最佳的医疗是所有人的愿望，但可能还有朋友不太了解日本东京的医疗资源优势，不仅优于北京上海，且看病方便程度甚至超过了他们",
                "readCount": "30",
                "community": "白血病圈子",
                "time": "次阅读 | 2天前"
            ],
            [
                "title": "最新癌症复合免疫疗法 ",
                "text": "肿瘤细胞免疫治疗是一种新兴的、具有显著疗效的肿瘤治疗模式，是一种自身免疫抗癌的新型治疗方法。运用生物技术和生物制剂对从病人体内采集的免疫细胞进行体外培养和扩增后回输到病人体内的方法，来激发，增强机体自身免疫功能，从而达到治疗肿瘤的目的。肿瘤细胞免疫疗法是继手术、放疗和化疗之后的第四大肿瘤治疗技术。",
                "readCount": "1万",
                "community": "中医养生",
                "time": "次阅读 | 2017-11-19"
            ]
        ]
        headerData = [
            "icon": "splash",
            "name": "林哥",
            "grade": "Lv 5",
            "location": "大连",
            "desc": "签名：先定个小目标，比方说，先赚它一个亿"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWProfileCell", for: indexPath)
        cell.selectionStyle = .none
        configCellWithJSON(cell as! WWProfileCell, self.data[indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWProfileCell, _ dict: [String: String]) {
        cell.articleTitleLabel.text = dict["title"] ?? ""
        cell.articleTextLabel.text = dict["text"] ?? ""
        cell.readCountLabel.text = dict["readCount"] ?? ""
        cell.communityNameLabel.text = dict["community"] ?? ""
        cell.articleTimeLabel.text = dict["time"] ?? ""
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        style.lineBreakMode = .byTruncatingTail
        cell.articleTextLabel.numberOfLines = 0
        cell.articleTextLabel.attributedText = NSAttributedString.init(string: dict["text"] ?? "", attributes: [
            NSAttributedStringKey.foregroundColor : wwTheme.fontColor1,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.paragraphStyle: style
            ])
    }

    // header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 340
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.loadFromNibNamed(nibNamed: "WWProfileHeaderView") as? WWProfileHeaderView
        configureHeaderViewWithJSON(headerView!, headerData)
        headerView!.delegate = self
        return headerView!
    }
    
    func configureHeaderViewWithJSON(_ header: WWProfileHeaderView, _ data: [String: String]) {
        header.icon.image = UIImage(named: iconName ?? "")
        header.nameLabel.text = data["name"] ?? ""
        header.gradeLabel.text = data["grade"] ?? ""
        header.locationLabel.text = data["location"] ?? ""
        header.descLabel.text = data["desc"] ?? ""
    }
    
    func removeBottomView() {
        bottomView.removeFromSuperview()
    }
    
    // bottom view
    func addBottomView() {
        let containerView = UIApplication.shared.windows.first!
        containerView.addSubview(bottomView)
        bottomView.backgroundColor = .white
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(50)
        }
        // follow btn & label
        let followButton = UIButton()
        followButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(followButton)
        followButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(bottomView.snp.centerX).offset(-WWSpecs.windowWidth()/4)
            make.width.height.equalTo(25)
            make.top.equalTo(bottomView.snp.top).offset(5)
        }
        followButton.setImage(UIImage(named: "guanzhu"), for: UIControlState())
        let followLabel = UILabel()
        followLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(followLabel)
        followLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(followButton.snp.centerX)
            make.top.equalTo(followButton.snp.bottom).offset(2)
        }
        followLabel.text = "关注"
        followLabel.font = UIFont.systemFont(ofSize: 12)
        followLabel.textColor = wwTheme.fontColor1
//        // chat btn & label
        let chatButton = UIButton()
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(chatButton)
        chatButton.snp.makeConstraints { (make) in make.centerX.equalTo(bottomView.snp.centerX).offset(WWSpecs.windowWidth()/4)
            make.width.height.equalTo(25)
            make.top.equalTo(bottomView.snp.top).offset(5)
        }
        chatButton.setImage(UIImage(named: "liaotian"), for: UIControlState())
        let chatLabel = UILabel()
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(chatLabel)
        chatLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(chatButton.snp.centerX)
            make.top.equalTo(chatButton.snp.bottom).offset(2)
        }
        chatLabel.text = "聊天"
        chatLabel.font = UIFont.systemFont(ofSize: 12)
        chatLabel.textColor = wwTheme.fontColor1
        
        // divider
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(divider)
        divider.snp.makeConstraints { (make) in
            make.centerX.equalTo(bottomView.snp.centerX)
            make.width.equalTo(1)
            make.top.equalTo(bottomView.snp.top).offset(5)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-5)
        }
        divider.backgroundColor = wwTheme.borderColor1
    }
}
