//
//  ViewController.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/11.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//


import UIKit

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

class WWViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


