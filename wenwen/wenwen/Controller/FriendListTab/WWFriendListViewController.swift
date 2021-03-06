//
//  WWFriendListViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/16.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit
import iCarousel

class WWFriendListViewController: WWTableViewController, iCarouselDataSource, iCarouselDelegate {
    
    var data = [[String: String]]()
    var diseasesData = [String]()
    private var seletedIndex: Int = 0
    private let iCarouselView = iCarousel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configRightBarItem()
        self.tableView.register(UINib(nibName: String(describing: WWFriendListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WWFriendListCell.self))
        data = [
            [
                "icon": "nan1",
                "name": "林哥",
                "desc": "先定一个能达到的小目标，比方说，先挣它一个亿",
                "gender": "nv",
                "age": "60岁",
                "location": "17:20 | 北京",
                "tagLeft": "病友",
                "tagRight": "乐于助人"
            ],
            [
                "icon": "nv1",
                "name": "云哥",
                "desc": "双十一我们不是为了挣钱，后悔创建阿里",
                "gender": "nan",
                "age": "30岁",
                "location": "昨天 | 杭州",
                "tagLeft": "病友家属",
                "tagRight": "看帖狂人"
            ],
            [
            "icon": "nan2",
            "name": "腾哥",
            "desc": "我们都是普通家庭，没有什么特殊的，顶多是房子大了点",
            "gender": "nv",
            "age": "26岁",
            "location": "周四 | 广东",
            "tagLeft": "病友",
            "tagRight": "答题之星"
            ],
            [
            "icon": "nv2",
            "name": "东哥",
            "desc": "我这个人是脸盲，就是说根本就分不清楚谁漂亮不漂亮，说实话。我跟她在一起不是因为她漂亮，因为我根本不知道她漂不漂亮，就是因为觉得她这个人就是心地非常善良和纯粹的一个人",
            "gender": "nan",
            "age": "26岁",
            "location": "周三 | 杭州",
            "tagLeft": "病友家属",
            "tagRight": "健康达人"
            ],
            [
            "icon": "nv3",
            "name": "老方",
            "desc": "地铁上，跑步时，戴上耳机，这就是你一个的舞台",
            "gender": "nv",
            "age": "26岁",
            "location": "周一 | 北京",
            "tagLeft": "病友",
            "tagRight": "水母"
            ],
            [
            "icon": "nan3",
            "name": "老铁",
            "desc": "一生之中弯弯曲曲我也要走过，当晚风轻轻吹过，闪出每个希望如",
            "gender": "nan",
            "age": "16岁",
            "location": "2017/11/1 | 上海",
            "tagLeft": "病友家属",
            "tagRight": "水王"
            ],
        ]
        diseasesData = [
            "癌症", "艾滋病", "白血病", "糖尿病", "抑郁症", "中医养生"
        ]
    }
    
    func configRightBarItem() {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "filter"), for: .normal)
        button.frame.size.width = 30
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
//        button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = wwTheme.fontColor6
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
            ]
        UIApplication.shared.statusBarStyle = .lightContent
        WWTool.setStatusBarBackgroundColor(color: wwTheme.fontColor6)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
//        self.navigationController?.navigationBar.shadowImage = nil
        WWTool.setStatusBarBackgroundColor(color: wwTheme.statusBarOriginalBGColor)
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WWFriendListCell", for: indexPath)
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            let listCell = cell as! WWFriendListCell
            listCell.topDividerLine.isHidden = false
        }
        configCellWithJSON(cell as! WWFriendListCell, self.data[indexPath.row])
        return cell
    }
    
    func configCellWithJSON(_ cell: WWFriendListCell, _ dict: [String: String]) {
        cell.iconImageView.image = UIImage(named: dict["icon"] ?? "")
        cell.nameLabel.text = dict["name"] ?? ""
        cell.descLabel.text = dict["desc"] ?? ""
        let gender = dict["gender"] ?? ""
        cell.genderImageView.image = UIImage(named: gender)
        cell.genderView.backgroundColor = (gender == "nv") ? wwTheme.bgColor1 : wwTheme.fontColor2
        cell.ageLabel.text = dict["age"] ?? ""
        cell.locationLabel.text = dict["location"] ?? ""
        cell.tagLeftLabel.text = dict["tagLeft"] ?? ""
        cell.tagRightLabel.text = dict["tagRight"] ?? ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WWProfileViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.iconName = data[indexPath.row]["icon"] ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    // MARK: - Header View
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 370
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = setupHeaderView()
//        headerView.backgroundColor = .gray
        return headerView
    }
    
    private func setupHeaderView() -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        // bottom gap view
        let gapView = UIView()
        gapView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(gapView)
        gapView.backgroundColor = wwTheme.bgColor2
        gapView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(12)
        }
        // bg imageview
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.top.equalTo(containerView.snp.top).offset(-64)
            make.height.equalTo(160)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "bg_home")
//        imageView.backgroundColor = .yellow
        // iCarousel view
        
        iCarouselView.dataSource = self
        iCarouselView.delegate = self
        iCarouselView.bounces = false
        iCarouselView.isPagingEnabled = true
        iCarouselView.type = .custom
        iCarouselView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iCarouselView)
        iCarouselView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.bottom.equalTo(gapView.snp.top).offset(-8)
//            make.top.equalTo(imageView.snp.bottom).offset(-WWSpecs.windowWidth()/6)
            make.centerY.equalTo(imageView.snp.bottom)
            make.height.equalTo(WWSpecs.windowWidth()/3+20)
        }
        iCarouselView.scrollToItem(at: self.seletedIndex, animated: false)
        addShadowForVisibleCarouselViews()
        return containerView
        
    }

    
    // MARK: - iCarousel Datasource and Delegate methods
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 6
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var iCarouselView = view as? CarouselView
        if iCarouselView == nil {
            iCarouselView = CarouselView.init(frame: CGRect.init(x: 0, y: 0, width: WWSpecs.windowWidth()/3-20, height: WWSpecs.windowWidth()/3+10))
        }
        iCarouselView!.imageView.image = UIImage(named: diseasesData[index])
        iCarouselView!.label.text = diseasesData[index]
        return iCarouselView!
    }
    
    func carousel(_ carousel: iCarousel, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        var newTransform = transform
        let max_scale: CGFloat = 1.0
        let min_scale: CGFloat = 0.8
        if offset <= 1 && offset >= -1 {
            let tempScale = offset < 0 ? 1+offset : 1-offset;
            let slope = (max_scale - min_scale) / 1;
            let scale = min_scale + slope*tempScale;
            newTransform = CATransform3DScale(newTransform, scale, scale, 1);
        } else {
            newTransform = CATransform3DScale(newTransform, min_scale, min_scale, 1);
        }
        return CATransform3DTranslate(newTransform, offset * (WWSpecs.windowWidth()/3-20) * 1.4, 0.0, 0.0);
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        addShadowForVisibleCarouselViews()
        self.seletedIndex = carousel.currentItemIndex
    }
    
    func addShadowForVisibleCarouselViews() {
        for view in self.iCarouselView.visibleItemViews {
            (view as? UIView)?.alpha = 0.7
        }
        self.iCarouselView.currentItemView?.alpha = 1
    }

}
