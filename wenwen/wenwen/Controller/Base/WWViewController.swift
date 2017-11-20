//
//  ViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import SVProgressHUD
import SnapKit
import UIKit

extension UIViewController {
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

final class WWBaseDelegate {
    static let shareDelegate = WWBaseDelegate()
    
    func defaultViewDidLoad(_ vc: UIViewController) {
        let tapRecognizer = UITapGestureRecognizer(target: vc, action: #selector(vc.dismissKeyboard))
        if let recognizerDelegate = vc as? UIGestureRecognizerDelegate {
            tapRecognizer.delegate = recognizerDelegate
        }
        vc.view.addGestureRecognizer(tapRecognizer)
        vc.navigationItem.leftBarButtonItem?.tintColor = wwTheme.bgColor2
        vc.navigationItem.rightBarButtonItem?.tintColor = wwTheme.bgColor2
    }
    
    func defaultViewWillAppear(_ vc: UIViewController) {
    }
    
    func defaultBackClicked(_ vc: UIViewController) {
        if let cnt = vc.navigationController?.viewControllers.count,
            cnt > 1 {
            _ = vc.navigationController?.popViewController(animated: true)
        } else {
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    var defaultStatusBarStyle: UIStatusBarStyle = .default
}

// View Controller
class WWViewController: UIViewController {
    weak var delegate = WWBaseDelegate.shareDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.defaultViewDidLoad(self)
        configNavigationItem()
    }
    
    @objc func backClicked() {
        delegate?.defaultBackClicked(self)
        SVProgressHUD.dismiss()
    }
    
    func configNavigationItem() {
        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
        backButton.sizeToFit()
        backButton.frame.size.width = 30
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        backButton.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}

// Taleview Controller
class WWTableViewController: UITableViewController, UIGestureRecognizerDelegate {
    weak var delegate = WWBaseDelegate.shareDelegate
    
    convenience init() {
        self.init(style: .grouped)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.defaultViewDidLoad(self)
        configNavigationItem()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.defaultViewWillAppear(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @objc func backClicked() {
        delegate?.defaultBackClicked(self)
    }
    
    func configNavigationItem() {
        if let vclist = self.navigationController?.viewControllers,
            vclist.count > 1 {
            let backButton = UIButton()
            backButton.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
            backButton.sizeToFit()
            backButton.frame.size.width = 30
            backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            backButton.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        }
    }
    
    // MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}

// a navigation controller handle back swipe gesture itself
final class WWNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        //    self.navigationBar.barTintColor = CLSpecs.navgationBarCorlor()
        //    self.navigationBar.tintColor = CLSpecs.navgationTitleCorlor()
        self.navigationBar.isTranslucent = false
        self.interactivePopGestureRecognizer?.isEnabled = true
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer is UIScreenEdgePanGestureRecognizer
    }
    
}

// 拥有scrollView的控制器，把subviews添加进 scrollContainerView
class WWScrollViewController: WWViewController {
    let scrollView = UIScrollView()
    let scrollContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollView()
    }
    
    func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.backgroundColor = .white
        scrollContainerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView.snp.edges)
            make.width.equalTo(UIScreen.main.bounds.size.width)
        }
    }
    
}


