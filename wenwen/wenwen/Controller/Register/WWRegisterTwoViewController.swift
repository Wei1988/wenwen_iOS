//
//  WWRegisterTwoViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/14.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import SnapKit
import UIKit

class WWRegisterTwoViewController: WWScrollViewController {
    // constants
    let margin: CGFloat = 15
    let titleViewHeight: CGFloat = 30
    let titleViewTopGap: CGFloat = 50
    let buttonsTopGap: CGFloat = 110
    let textfieldViewHeight: CGFloat = 46
    var buttonTopConstraint: Constraint?
    // UI items
    private let titleView = UIView()
    private let nameTextfieldView = WWTextFieldView(false)
    private let birthdayTextfieldView = WWTextFieldView(true)
    private let genderTextfieldView = WWTextFieldView(true)
    private let statusTextfieldView = WWTextFieldView(true)
    private let cityTextfieldView = WWTextFieldView(true)
    private let nextStepButton = UIButton()
    private let previousButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        let gap = WWSpecs.windowHeight() - (titleViewTopGap+titleViewHeight+textfieldViewHeight+5*textfieldViewHeight+4*13+buttonsTopGap+2*45+2*20)-64
        buttonTopConstraint?.update(offset: buttonsTopGap + gap)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
////        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAndLayoutView()
    }
    
    // MARK: - Button Actions
    @objc func previousButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonClicked() {
        let vc = WWRegisterThreeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupAndLayoutView() {
        setupTitleView()
        setupTextfieldViews()
        setupButton()
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
        label.text = "完善资料让别人更容易找到你"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = wwTheme.fontColor4
    }
    
    func setupTextfieldViews() {
        // name text field
        nameTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(nameTextfieldView)
        commonSetupForTextfieldView(nameTextfieldView, titleView, 90, "昵称", "nicheng")
        // birthday text field
        birthdayTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(birthdayTextfieldView)
        commonSetupForTextfieldView(birthdayTextfieldView, nameTextfieldView, 13, "生日", "shengri")
        // gender text field
        genderTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(genderTextfieldView)
        commonSetupForTextfieldView(genderTextfieldView, birthdayTextfieldView, 13, "性别", "xingbie")
        // status text field
        statusTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(statusTextfieldView)
        commonSetupForTextfieldView(statusTextfieldView, genderTextfieldView, 13, "身份", "shenfen")
        // city text field
        cityTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(cityTextfieldView)
        commonSetupForTextfieldView(cityTextfieldView, statusTextfieldView, 13, "所在城市", "city")
    }
    
    func commonSetupForTextfieldView(_ view: WWTextFieldView, _ topView: UIView, _ topGap: CGFloat, _ text: String, _ imageName: String) {
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(textfieldViewHeight)
            make.top.equalTo(topView.snp.bottom).offset(topGap)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
        }
        let attString = NSAttributedString(string: text,
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        view.iconView.image = UIImage(named: imageName)
        view.textfield.attributedPlaceholder = attString
        view.textfield.textColor = wwTheme.fontColor4
        view.textfield.font = UIFont.systemFont(ofSize: 14)
    }
   
    func setupButton() {
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(previousButton)
        previousButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            buttonTopConstraint = make.top.equalTo(cityTextfieldView.snp.bottom).offset(buttonsTopGap).constraint
           
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
        let attStringNS = NSAttributedString(string: "下一步",
                                             attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor3,
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        nextStepButton.setAttributedTitle(attStringNS, for: UIControlState())
        nextStepButton.backgroundColor = wwTheme.fontColor2
        nextStepButton.layer.cornerRadius = 8
        nextStepButton.layer.masksToBounds = true
        nextStepButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    
}
