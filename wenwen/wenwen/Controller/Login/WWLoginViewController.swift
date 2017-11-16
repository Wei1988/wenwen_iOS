//
//  WWLoginViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/15.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import SnapKit
import UIKit

class WWLoginViewController: WWScrollViewController {
    // constants
    let textfieldViewTopGap: CGFloat = 50
    let textfieldViewHeight: CGFloat = 45
    let margin: CGFloat = 15
    let gap: CGFloat = 13
    let buttonTopGap: CGFloat = 45
    let buttonHeight: CGFloat = 45
    let titleViewHeight: CGFloat = 30
    let titleViewTopGap: CGFloat = 50
    var buttonTopConstraint: Constraint?
    // UI Items
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let textfieldContainerView = UIView()
    private let phoneTextfieldView = WWTextFieldView(false)
    private let passwordTextfieldView = WWTextFieldView(false)
    private let buttonView = UIView()
    private let forgetPasswordButton = UIButton()
    private let registerButton = UIButton()
    private let loginButton = UIButton()
    private let loginLabel = UILabel()
    private let dividerLine = UIView()
    private let qqImageView = UIImageView()
    private let wechatImageView = UIImageView()
    private let weiboImageView = UIImageView()
    private let bgImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = .white
        scrollContainerView.backgroundColor = .white
        setupAndLayoutViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let gap = WWSpecs.windowHeight() - (titleViewTopGap+titleViewHeight+textfieldViewTopGap+93+30+buttonTopGap+buttonHeight+170+20+30+46+20)-40
        buttonTopConstraint?.update(offset: 170 + gap)
    }
    
    func setupAndLayoutViews() {
        setuptitleLabel()
        setupTextfieldViews()
        setupLabels()
        setupButtons()
        setupBottomViews()
        setupBgImageView()
    }
    
    // MARK: - Button actions
    @objc func loginButtonClicked() {
        
    }
    
    @objc func registerButtonClicked() {
        let vc = WWRegisterOneViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func forgetPasswordButtonClicked() {
        
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
        titleLabel.text = "登录"
        titleLabel.textColor = wwTheme.fontColor4
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 22)
    }
    
    func setupTextfieldViews() {
        textfieldContainerView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(textfieldContainerView)
        textfieldContainerView.layer.borderWidth = 1
        textfieldContainerView.layer.borderColor = wwTheme.fontColor1.cgColor
        textfieldContainerView.snp.makeConstraints { (make) in
            make.height.equalTo(93)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(titleView.snp.bottom).offset(textfieldViewTopGap)
        }
        phoneTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        textfieldContainerView.addSubview(phoneTextfieldView)
        commonSetupForTextfieldView(phoneTextfieldView, textfieldContainerView, textfieldViewTopGap, "手机号", "phone", true)
        phoneTextfieldView.layer.cornerRadius = 0
        passwordTextfieldView.translatesAutoresizingMaskIntoConstraints = false
        textfieldContainerView.addSubview(passwordTextfieldView)
        commonSetupForTextfieldView(passwordTextfieldView, textfieldContainerView, 1, "密码", "password", false)
        passwordTextfieldView.layer.cornerRadius = 0
        passwordTextfieldView.textfield.isSecureTextEntry = true
        // middle divider line
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        textfieldContainerView.addSubview(divider)
        divider.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(textfieldContainerView.snp.left)
            make.right.equalTo(textfieldContainerView.snp.right)
            make.centerY.equalTo(textfieldContainerView.snp.centerY)
        }
        divider.backgroundColor = wwTheme.fontColor1
    }
    
    func commonSetupForTextfieldView(_ view: WWTextFieldView, _ topView: UIView, _ topGap: CGFloat, _ text: String, _ imageName: String, _ isTop: Bool) {
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(view)
        if isTop {
            view.snp.makeConstraints { (make) in
                make.height.equalTo(46)
                make.top.equalTo(topView.snp.top)
                make.left.equalTo(topView.snp.left)
                make.right.equalTo(topView.snp.right)
            }
        } else {
            view.snp.makeConstraints { (make) in
                make.height.equalTo(46)
                make.bottom.equalTo(topView.snp.bottom)
                make.left.equalTo(topView.snp.left)
                make.right.equalTo(topView.snp.right)
            }
        }
        view.layer.borderWidth = 0
        let attString = NSAttributedString(string: text,
                                           attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor1,
                                                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
        view.iconView.image = UIImage(named: imageName)
        view.textfield.attributedPlaceholder = attString
        view.textfield.textColor = wwTheme.fontColor4
        view.textfield.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupLabels() {
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(buttonView)
        buttonView.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(passwordTextfieldView.snp.bottom).offset(gap)
        }
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        buttonView.addSubview(forgetPasswordButton)
        forgetPasswordButton.snp.makeConstraints { (make) in
            make.left.equalTo(buttonView.snp.left)
            make.top.equalTo(buttonView.snp.top)
            make.bottom.equalTo(buttonView.snp.bottom)
        }
        forgetPasswordButton.setTitle("忘记密码", for: UIControlState())
        forgetPasswordButton.setTitleColor(wwTheme.fontColor4, for: UIControlState())
        forgetPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        buttonView.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(buttonView.snp.top)
            make.bottom.equalTo(buttonView.snp.bottom)
            make.right.equalTo(buttonView.snp.right)
        }
        registerButton.setTitleColor(wwTheme.fontColor2, for: UIControlState())
        registerButton.setTitle("没有账号，去注册", for: UIControlState())
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    
    func setupButtons() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.top.equalTo(buttonView.snp.bottom).offset(45)
        }
        let attStringNS = NSAttributedString(string: "登录",
                                             attributes: [NSAttributedStringKey.foregroundColor: wwTheme.fontColor3,
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        loginButton.setAttributedTitle(attStringNS, for: UIControlState())
        loginButton.backgroundColor = wwTheme.fontColor2
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    func setupBottomViews() {
        
        let labelView = UIView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(labelView)
        // divider line
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(dividerLine)
        dividerLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(scrollContainerView.snp.left).offset(margin)
            make.right.equalTo(labelView.snp.left)
            make.centerY.equalTo(labelView.snp.centerY)
        }
        let dividerLineRight = UIView()
        dividerLineRight.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(dividerLineRight)
        dividerLineRight.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(labelView.snp.right)
            make.right.equalTo(scrollContainerView.snp.right).offset(-margin)
            make.centerY.equalTo(labelView.snp.centerY)
        }
        // label view
        labelView.snp.makeConstraints { (make) in
            buttonTopConstraint = make.top.equalTo(loginButton.snp.bottom).offset(170).constraint
            make.centerX.equalTo(scrollContainerView.snp.centerX)
            make.width.equalTo(140)
            make.height.equalTo(20)
        }
        // login label
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        labelView.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(labelView.snp.edges)
        }
        loginLabel.text = "使用其他方式登录"
        loginLabel.font = UIFont.systemFont(ofSize: 14)
        loginLabel.textColor = wwTheme.fontColor1
        loginLabel.textAlignment = .center
        dividerLine.backgroundColor = wwTheme.fontColor1
        dividerLineRight.backgroundColor = wwTheme.fontColor1
        dividerLineRight.alpha = 0.5
        dividerLine.alpha = 0.5
        // iamge views
        qqImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(qqImageView)
        qqImageView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left).offset(36)
            make.width.height.equalTo(46)
            make.top.equalTo(labelView.snp.bottom).offset(30)
            make.bottom.equalTo(scrollContainerView.snp.bottom).offset(-20)
        }
        qqImageView.image = UIImage.init(named: "QQ")
        // sina weibo
        weiboImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(weiboImageView)
        weiboImageView.snp.makeConstraints { (make) in
            make.right.equalTo(scrollContainerView.snp.right).offset(-36)
            make.width.height.equalTo(46)
            make.top.equalTo(labelView.snp.bottom).offset(30)
            make.bottom.equalTo(scrollContainerView.snp.bottom).offset(-20)
        }
        weiboImageView.image = UIImage(named: "sina")
        // wechat
        wechatImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(wechatImageView)
        wechatImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollContainerView.snp.centerX)
            make.width.height.equalTo(46)
            make.top.equalTo(labelView.snp.bottom).offset(30)
            make.bottom.equalTo(scrollContainerView.snp.bottom).offset(-20)
        }
        wechatImageView.image = UIImage(named: "wechat")
    }
    
    func setupBgImageView() {
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.bottom.equalTo(scrollContainerView.snp.bottom)
        }
        bgImageView.contentMode = .scaleAspectFit
        bgImageView.image = UIImage(named: "loginBG")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
