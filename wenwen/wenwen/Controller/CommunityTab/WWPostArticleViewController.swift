//
//  WWPostArticleViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/27.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit
import YYText

class WWPostArticleViewController: WWScrollViewController, YYTextViewDelegate {
    
    private let titleTextField = UITextField()
    private let contentTextView = YYTextView()
    private let bottomView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发表帖子"
        view.backgroundColor = .white
        scrollContainerView.backgroundColor = .white
        configRightBarItem()
        setupView()
    }

    func configRightBarItem() {
        let button = UIButton()
        button.setTitle("发帖", for: UIControlState())
        button.setTitleColor(wwTheme.fontColor2, for: UIControlState())
//        button.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        button.setTitleColor(wwTheme.fontColor2, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.frame.size.width = 30
        //        button.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func setupView() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left).offset(16)
            make.right.equalTo(scrollContainerView.snp.right)
            make.top.equalTo(scrollContainerView.snp.top)
            make.height.equalTo(46)
        }
        titleTextField.attributedPlaceholder = NSAttributedString.init(string: "好标题会被更多人看到哦！（必填）", attributes: [
            NSAttributedStringKey.foregroundColor: wwTheme.placeholderColor,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)
            
            ])
        // divider
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(divider)
        divider.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.top.equalTo(titleTextField.snp.bottom)
            make.height.equalTo(1)
        }
        divider.backgroundColor = wwTheme.borderColor1
        // content textView
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left).offset(15)
            make.top.equalTo(divider.snp.bottom).offset(5)
            make.right.equalTo(divider.snp.right)
            make.height.equalTo(WWSpecs.windowHeight()-64-46-1-46-5)
        }
        contentTextView.placeholderText = "文章内容，不少于五个字，可在文字中插入图片"
        contentTextView.placeholderFont = UIFont.systemFont(ofSize: 15)
        contentTextView.placeholderTextColor = wwTheme.placeholderColor
        contentTextView.delegate = self
        contentTextView.font = UIFont.systemFont(ofSize: 15)
        contentTextView.becomeFirstResponder()
        contentTextView.isUserInteractionEnabled = true
        contentTextView.isEditable = true
        contentTextView.isUserInteractionEnabled = true
        
        // bottom view
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollContainerView.snp.left)
            make.right.equalTo(scrollContainerView.snp.right)
            make.bottom.equalTo(scrollContainerView.snp.bottom)
            make.height.equalTo(46)
            make.top.equalTo(contentTextView.snp.bottom)
        }
        bottomView.backgroundColor = wwTheme.bgColor2
        let imageBtn = UIButton()
        imageBtn.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(imageBtn)
        imageBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalTo(bottomView.snp.centerY)
            make.left.equalTo(scrollContainerView.snp.left).offset(16)
        }
        imageBtn.setImage(UIImage(named: "tupian"), for: UIControlState())
        let emojiBtn = UIButton()
        emojiBtn.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(emojiBtn)
        emojiBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalTo(bottomView.snp.centerY)
            make.left.equalTo(imageBtn.snp.right).offset(20)
        }
        emojiBtn.setImage(UIImage(named: "biaoqing"), for: UIControlState())
    }
    
    // MARK: - Delegate methods
    func textView(_ textView: YYTextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func textViewShouldEndEditing(_ textView: YYTextView) -> Bool {
        return true
    }

}
