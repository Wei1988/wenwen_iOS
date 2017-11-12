//
//  WWRegisterOneViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit
import SnapKit

class WWRegisterOneViewController: WWScrollViewController {
    // constants
    let margin: CGFloat = 15
    let phoneTopGap: CGFloat = 120
    var buttonTopConstraint: Constraint?
    // UI Items
    private let phoneTextfieldView = WWTextFieldView(false)
    private let captchaTextfieldView = WWTextFieldView(false)
    private let passwordTextfieldView = WWTextFieldView(false)
    private let policyLabel = UILabel()
    private let policyButton = UIButton()
    private let loginButton = UIButton()
    private let nextStepButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: wwTheme.fontColor4]
        scrollContainerView.backgroundColor = wwTheme.bgGray1
        scrollView.backgroundColor = wwTheme.bgGray1
        setupAndLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let gap = WWSpecs.windowHeight() - (phoneTopGap+46+13+46+13+46+13+16+160+45+20+45+20) - 64
        buttonTopConstraint?.update(offset: 160 + gap)
    }
    
    func setupAndLayout() {
        setupPhoneTextfieldView()
        setupCaptchaTextfieldView()
        setupPasswordTextfieldView()
        setupPolicyView()
        setupAndLayoutBottomButtons()
    }
    
    func setupPhoneTextfieldView() {
        phoneTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(phoneTextfieldView)
        phoneTextfieldView.snp.makeConstraints { (make) in
            make.height.equalTo(46)
            make.top.equalTo(scrollContainerView.snp.top).offset(phoneTopGap)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
        }
        let attString = NSAttributedString(string: "请输入手机号",
                                     attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        phoneTextfieldView.iconView.image = UIImage(named: "back_button")
        phoneTextfieldView.textfield.attributedPlaceholder = attString
        phoneTextfieldView.textfield.textColor = wwTheme.fontColor4
        phoneTextfieldView.textfield.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupCaptchaTextfieldView() {
        captchaTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(captchaTextfieldView)
        captchaTextfieldView.snp.makeConstraints { (make) in
            make.height.equalTo(46)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(phoneTextfieldView.snp.bottom).offset(13)
        }
        let attString = NSAttributedString(string: "请输入验证码",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        captchaTextfieldView.iconView.image = UIImage(named: "back_button")
        captchaTextfieldView.textfield.attributedPlaceholder = attString
        captchaTextfieldView.textfield.textColor = wwTheme.fontColor4
        captchaTextfieldView.textfield.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupPasswordTextfieldView() {
        passwordTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(passwordTextfieldView)
        passwordTextfieldView.snp.makeConstraints { (make) in
            make.height.equalTo(46)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(captchaTextfieldView.snp.bottom).offset(13)
        }
        let attString = NSAttributedString(string: "请设置密码",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        passwordTextfieldView.iconView.image = UIImage(named: "back_button")
        passwordTextfieldView.textfield.attributedPlaceholder = attString
        passwordTextfieldView.textfield.textColor = wwTheme.fontColor4
        passwordTextfieldView.textfield.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupPolicyView() {
        policyLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(policyLabel)
        policyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.top.equalTo(passwordTextfieldView.snp.bottom).offset(13)
        }
        policyLabel.attributedText = NSAttributedString(string: "注册表明同意",
                                                        attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                                     NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)])
        policyButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(policyButton)
        let attString = NSAttributedString(string: "《问问用户协议》",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor2,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)])
        policyButton.setAttributedTitle(attString, for: UIControlState())
        policyButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(policyLabel.snp.centerY)
            make.left.equalTo(policyLabel.snp.right).offset(2)
        }
    }
    
    func setupAndLayoutBottomButtons() {
        // login button
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            buttonTopConstraint = make.top.equalTo(policyLabel.snp.bottom).offset(160).constraint
        }
        let attString = NSAttributedString(string: "已有账号，请登录",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor2,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        loginButton.setAttributedTitle(attString, for: UIControlState())
        loginButton.layer.borderColor = wwTheme.fontColor2.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        // next step button
        nextStepButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(nextStepButton)
        nextStepButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.bottom.equalTo(scrollContainerView.snp.bottom).offset(-20)
        }
        let attStringNS = NSAttributedString(string: "下一步",
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor3,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        nextStepButton.setAttributedTitle(attStringNS, for: UIControlState())
        nextStepButton.backgroundColor = wwTheme.fontColor2
        nextStepButton.layer.cornerRadius = 8
        nextStepButton.layer.masksToBounds = true
    }
}
