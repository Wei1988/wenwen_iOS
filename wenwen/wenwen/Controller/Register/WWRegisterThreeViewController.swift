//
//  WWRegisterThreeViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/15.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import SnapKit
import UIKit

class WWRegisterThreeViewController: WWScrollViewController {
    // 常数
    let margin: CGFloat = 15
    let titleViewHeight: CGFloat = 30
    let titleViewTopGap: CGFloat = 50
    let buttonsTopGap: CGFloat = 60
    let collectionViewTopGap: CGFloat = 60
    let textfieldViewHeight: CGFloat = 46
    let collectionViewHeight: CGFloat = WWSpecs.windowWidth()*0.93
    var buttonTopConstraint: Constraint?
    // UI控件
    private let titleView = UIView()
    private let nextStepButton = UIButton()
    private let previousButton = UIButton()
    // 模拟数据
    private let images: [String] = ["yiyu", "yangsheng", "qita", "aizheng", "aizi", "baixue", "tangniao"]
    //自定义的环形布局
    var loopLayout:LoopCollectionViewLayout!
    private var collectionView:UICollectionView!
    //重用的单元格的Identifier
    let CellIdentifier = "loopCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        let gap = WWSpecs.windowHeight() - (titleViewTopGap+titleViewHeight+collectionViewTopGap+collectionViewHeight+buttonsTopGap+2*45+2*20)-20
        buttonTopConstraint?.update(offset: buttonsTopGap + gap)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAndLayoutViews()
    }
    
    func setupAndLayoutViews() {
        setupTitleView()
        setupCollectionView()
        setupButtons()
        setupBgImageView() 
    }
    
    // MARK: - Button Actions
    @objc func previousButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonClicked() {
        let vc = WWHomeTabBarViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTitleView() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(titleView)
        titleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollContainerView.snp.centerX)
            make.height.equalTo(titleViewHeight)
            make.top.equalTo(scrollContainerView.snp.top).offset(titleViewTopGap)
        }
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(titleView.snp.edges)
        }
        label.textAlignment = .center
        label.text = "选择您的患病类型"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = wwTheme.fontColor4
    }
    
    func setupCollectionView() {
        //初始化Collection View
        initCollectionView()
        
        //注册tap点击事件
        //        let tapRecognizer = UITapGestureRecognizer(target: self,
        //                                                   action: #selector(ViewController.handleTap(_:)))
        //        collectionView.addGestureRecognizer(tapRecognizer)
    }
    
    func setupButtons() {
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(previousButton)
        previousButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            buttonTopConstraint = make.top.equalTo(collectionView.snp.bottom).offset(buttonsTopGap).constraint
            
        }
        let attString = NSAttributedString(string: "上一步",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor2,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        previousButton.setAttributedTitle(attString, for: UIControlState())
        previousButton.layer.borderColor = wwTheme.fontColor2.cgColor
        previousButton.layer.borderWidth = 1
        previousButton.layer.cornerRadius = 8
        previousButton.layer.masksToBounds = true
        previousButton.addTarget(self, action: #selector(previousButtonClicked), for: .touchUpInside)
        nextStepButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(nextStepButton)
        nextStepButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(previousButton.snp.bottom).offset(20)
            make.bottom.equalTo(scrollContainerView.snp.bottom).offset(-20)
        }
        let attStringNS = NSAttributedString(string: "去主页",
                                             attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor3,
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        nextStepButton.setAttributedTitle(attStringNS, for: UIControlState())
        nextStepButton.backgroundColor = wwTheme.fontColor2
        nextStepButton.layer.cornerRadius = 8
        nextStepButton.layer.masksToBounds = true
        nextStepButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    
    func setupBgImageView() {
        let bgImageView = UIImageView()
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.bottom.equalTo(scrollContainerView.snp.bottom)
        }
        bgImageView.contentMode = .scaleAspectFit
        bgImageView.image = UIImage(named: "RegisterThree")
        
    }
    
    private func initCollectionView() {
        //初始化自定义布局
        loopLayout = LoopCollectionViewLayout()
        
        //初始化Collection View
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: loopLayout)
        
        //Collection View代理设置
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        //注册重用的单元格
        let cellXIB = UINib.init(nibName: "RegisterLoopCell", bundle: Bundle.main)
        collectionView.register(cellXIB, forCellWithReuseIdentifier: CellIdentifier)
        
        //将Collection View添加到主视图中
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(collectionViewHeight)
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.top.equalTo(titleView.snp.bottom).offset(collectionViewTopGap)
        }
    }


}

//Collection View数据源协议相关方法
extension WWRegisterThreeViewController: UICollectionViewDataSource {
    //获取分区数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //获取每个分区里单元格数量
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //返回每个单元格视图
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //获取重用的单元格
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CellIdentifier, for: indexPath) as! RegisterLoopCell
        //设置内部显示的图片
        cell.imageView.image = UIImage(named: images[indexPath.row])
//        cell.titleLabel.text = texts[indexPath.row]
//        cell.titleLabel.font = UIFont.systemFont(ofSize: 14)
//        cell.titleLabel.textColor = wwTheme.fontColor4
        //设置遮罩
        cell.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        cell.layer.cornerRadius = cell.bounds.width/2
        cell.backgroundColor = wwTheme.fontColor5
        return cell
    }
    
}

//Collection View样式布局协议相关方法
extension WWRegisterThreeViewController: UICollectionViewDelegate {
    
}
