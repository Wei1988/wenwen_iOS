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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configRightBarItem()
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    // MARK: - Header View
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 350
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = setupHeaderView()
//        headerView.backgroundColor = .gray
        return headerView
    }
    
    private func setupHeaderView() -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
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
        let iCarouselView = iCarousel()
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
            make.bottom.equalTo(containerView.snp.bottom).offset(-10)
//            make.top.equalTo(imageView.snp.bottom).offset(-WWSpecs.windowWidth()/6)
            make.centerY.equalTo(imageView.snp.bottom)
            make.height.equalTo(WWSpecs.windowWidth()/3+20)
        }
        return containerView
    }

    
    // MARK: - iCarousel Datasource and Delegate methods
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 2
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var iCarouselView = view as? CarouselView
        if iCarouselView == nil {
            iCarouselView = CarouselView.init(frame: CGRect.init(x: 0, y: 0, width: WWSpecs.windowWidth()/3, height: WWSpecs.windowWidth()/3))
            
        }
        iCarouselView!.imageView.image = UIImage(named: "splash")
        iCarouselView!.label.text = "癌症"
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
        return CATransform3DTranslate(newTransform, offset * (WWSpecs.windowWidth()/3) * 1.3, 0.0, 0.0);
    }
    

    

    

}
