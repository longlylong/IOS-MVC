//
//  BaseUIViewController.swift
//  wysdkdemo
//
//  Created by weiyin on 16/6/20.
//  Copyright © 2016年 weiyin. All rights reserved.
//

import Foundation
class BaseUIViewController : UIViewController {
    
    override func viewDidLoad() {
        initUI()
        initData()
        initListener()
    }
    
    func initUI() {
        
    }
    
    func initData() {
        
    }
    
    func initListener() {
        
    }
    
    func getIconButton(_ frame:CGRect,iconName:String,action:Selector)->UIButton{
        let button = UIButton(frame: frame)
        button.setImage(UIImage(named:iconName), for: UIControlState())
        button.addTarget(self, action: action, for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        return button
    }
    
    func setNavTextButton(){
        let backButton = UIButton()
        backButton.addTarget(self, action: #selector(SelectDataViewController.handleLeftButton), for: .touchUpInside)
        backButton.setTitle("关闭", for: UIControlState())
        backButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        backButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        let rightButton = UIButton()
        rightButton.addTarget(self, action: #selector(SelectDataViewController.handleRightButton), for: .touchUpInside)
        rightButton.setTitle("预览排版", for: UIControlState())
        rightButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        rightButton.frame = CGRect(x: 0, y: 0, width: 64, height: 40)
        rightButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        let backItem = UIBarButtonItem(customView: backButton)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
}
