//
//  WWConversationViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/22.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

class WWConversationViewController: WWViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [[String: String]]()
    
    private let bottomBarView = UIView()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = wwTheme.bgGray2
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
        ]
        title = "小明"
        configRightBarItem()
        setupView()
        registerCell()
        setData()
    }
    
    func setData() {
        data = [
            [
                "icon": "splash",
                "text": "抗癌心得，生活感悟，在这里释放你的心情"
            ],
            [
                "icon": "splash",
                "text": "发起募捐，献爱心，寻找好的心灵慰藉发起募捐，献爱心，寻找好的心灵慰藉发起募捐，献爱心，寻找好的心灵慰藉发起募捐，献爱心，寻找好的心灵慰藉"
            ],
            [
                "icon": "splash",
                "text": "欢迎加入问问大家庭欢迎加入问问大家庭"
            ],
            [
                "icon": "splash",
                "text": "欢迎加入问问大家庭欢迎加入问问大家庭欢迎加入问问大家庭"
            ],
            [
                "icon": "splash",
                "text": "欢迎加入问问大家庭欢迎加入问问大家庭欢迎加入问问大家庭"
            ],
            
        ]
    }
    
    func configRightBarItem() {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "person"), for: .normal)
        button.frame.size.width = 30
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        //        button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func registerCell() {
        self.tableView.register(UINib(nibName: String(describing: WWChatReceiveCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWChatReceiveCell.self))
        self.tableView.register(UINib(nibName: String(describing: WWChatSendCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWChatSendCell.self))
    }
    
    func setupView() {
        setupBottomBarView()
        setupTableView()
    }
    
    func setupBottomBarView() {
        bottomBarView.backgroundColor = wwTheme.statusBarOriginalBGColor
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomBarView)
        bottomBarView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
            make.height.equalTo(46)
        }
        // voice button
        let voiceButton = UIButton()
        voiceButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.addSubview(voiceButton)
        voiceButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomBarView.snp.centerY)
            make.width.height.equalTo(30)
            make.left.equalTo(bottomBarView.snp.left).offset(14)
        }
        voiceButton.setImage(UIImage(named: "voice"), for: UIControlState())
        // text field
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(voiceButton.snp.right).offset(6)
            make.centerY.equalTo(bottomBarView.snp.centerY)
            make.height.equalTo(30)
        }
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = wwTheme.borderColor1.cgColor
        // emoji button
        let emojiButton = UIButton()
        emojiButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.addSubview(emojiButton)
        emojiButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomBarView.snp.centerY)
            make.width.height.equalTo(30)
            make.left.equalTo(textField.snp.right).offset(6)
        }
        emojiButton.setImage(UIImage(named: "emoji"), for: UIControlState())
        // add button
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.addSubview(addButton)
        addButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomBarView.snp.centerY)
            make.width.height.equalTo(30)
            make.right.equalTo(bottomBarView.snp.right).offset(-14)
            make.left.equalTo(emojiButton.snp.right).offset(6)
        }
        addButton.setImage(UIImage(named: "add"), for: UIControlState())
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(bottomBarView.snp.top)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50
    }
    
    // MARK: - TableView datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = indexPath.row < 2 ?  tableView.dequeueReusableCell(withIdentifier: "WWChatReceiveCell", for: indexPath) : tableView.dequeueReusableCell(withIdentifier: "WWChatSendCell", for: indexPath)
        cell.selectionStyle = .none
        if let receiveCell = (cell as? WWChatReceiveCell) {
            configCellWithJSON(receiveCell, self.data[indexPath.row])
        } else if let sendCell = (cell as? WWChatSendCell) {
            configCellWithJSON2(sendCell, self.data[indexPath.row])
        }
        
        return cell
    }
    
    func configCellWithJSON(_ cell: WWChatReceiveCell, _ dict: [String: String]) {
        
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
//        cell.receiveTextLabel.text = dict["text"] ?? ""
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2.5
        style.lineBreakMode = .byTruncatingTail
        cell.receiveTextLabel.numberOfLines = 0
        cell.receiveTextLabel.attributedText = NSAttributedString.init(string: dict["text"] ?? "", attributes: [
            NSAttributedStringKey.foregroundColor : wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.paragraphStyle: style
            ])
    }
    
    func configCellWithJSON2(_ cell: WWChatSendCell, _ dict: [String: String]) {
        
        cell.icon.image = UIImage(named: dict["icon"] ?? "")
        //        cell.receiveTextLabel.text = dict["text"] ?? ""
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2.5
        style.lineBreakMode = .byTruncatingTail
        cell.sendTextLabel.numberOfLines = 0
        cell.sendTextLabel.attributedText = NSAttributedString.init(string: dict["text"] ?? "", attributes: [
            NSAttributedStringKey.foregroundColor : wwTheme.fontColor4,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.paragraphStyle: style
            ])
    }
   
    
}
