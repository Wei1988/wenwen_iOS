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
    let phoneTopGap: CGFloat = 90
    let titleViewHeight: CGFloat = 30
    let titleViewTopGap: CGFloat = 50
    var buttonTopConstraint: Constraint?
    // UI Items
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let phoneTextfieldView = WWTextFieldView(false)
    private let captchaTextfieldView = WWTextFieldView(false)
    private let passwordTextfieldView = WWTextFieldView(false)
    private let policyLabel = UILabel()
    private let policyButton = UIButton()
    private let loginButton = UIButton()
    private let nextStepButton = UIButton()
    private let countDownButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollContainerView.backgroundColor = .white
        scrollView.backgroundColor = .white
        setupAndLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        let gap = WWSpecs.windowHeight() - (titleViewTopGap+titleViewHeight+phoneTopGap+46+13+46+13+46+13+16+160+45+20+45+20)-20
        buttonTopConstraint?.update(offset: 160 + gap)
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
////        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
////        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    // MARK: - Button Actions
    @objc func nextStepButtonClicked() {
        let vc = WWRegisterTwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginButtonClicked() {
        let vc = WWLoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupAndLayout() {
        setuptitleLabel()
        setupPhoneTextfieldView()
        setupCaptchaTextfieldView()
        setupPasswordTextfieldView()
        setupPolicyView()
        setupAndLayoutBottomButtons()
    }
    
    func setuptitleLabel() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(titleView)
        titleView.snp.makeConstraints { (make) in
            make.height.equalTo(titleViewHeight)
            make.centerX.equalTo(scrollContainerView.snp.centerX)
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.top.equalTo(scrollContainerView.snp.top).offset(52)
        }
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(titleView.snp.edges)
        }
        titleLabel.text = "注册"
        titleLabel.textColor = wwTheme.fontColor4
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 22)
    }
    
    func setupPhoneTextfieldView() {
        phoneTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(phoneTextfieldView)
        phoneTextfieldView.snp.makeConstraints { (make) in
            make.height.equalTo(46)
            make.top.equalTo(titleView.snp.bottom).offset(phoneTopGap)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
        }
        let attString = NSAttributedString(string: "请输入手机号",
                                     attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        phoneTextfieldView.iconView.image = UIImage(named: "phone")
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
        captchaTextfieldView.iconView.image = UIImage(named: "yanzheng")
        captchaTextfieldView.textfield.attributedPlaceholder = attString
        captchaTextfieldView.textfield.textColor = wwTheme.fontColor4
        captchaTextfieldView.textfield.font = UIFont.systemFont(ofSize: 14)
        captchaTextfieldView.textFieldRightConstraint?.update(offset: -100)
        // 倒计时按钮
        let dividerLine = UIView()
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.backgroundColor = wwTheme.fontColor1
        captchaTextfieldView.addSubview(dividerLine)
        dividerLine.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(18)
            make.top.equalTo(captchaTextfieldView.snp.top).offset(14)
            make.right.equalTo(captchaTextfieldView.snp.right).offset(-100)
        }
        countDownButton.translatesAutoresizingMaskIntoConstraints = false
        captchaTextfieldView.addSubview(countDownButton)
        countDownButton.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.centerY.equalTo(captchaTextfieldView.snp.centerY)
            make.right.equalTo(captchaTextfieldView.snp.right).offset(-10)
        }
        countDownButton.setTitle("获取验证码", for: UIControlState())
        countDownButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        countDownButton.setTitleColor(wwTheme.fontColor2, for: UIControlState())
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
        passwordTextfieldView.iconView.image = UIImage(named: "password")
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
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
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
        nextStepButton.addTarget(self, action: #selector(nextStepButtonClicked), for: .touchUpInside)
    }
}
