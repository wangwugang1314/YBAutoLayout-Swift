//
//  YBController_14.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_14: YBBaseController {
    
    var dataStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 如果是label的话不能使用yb_alignment布局，必须指定宽度（目前我也不是太清楚原因，约束的这样约束的时候会出问题）"),
                       YBCellModel(title: "2. 可以设定内容大小与右侧的间距")]
        
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 300))
        
        superView.yb_center(view: scrollView, size: yb_layoutSize(size: 250))
        
        let str = "345345345345345345"
        let num = Int.yb_random(between: 10, and: 20)
        for _ in 0..<num {
            dataStr += str
        }
        let label = UILabel()
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.backgroundColor = UIColor.gray
        label.text = dataStr
        
//        scrollView.addSubview(label)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: scrollView, attribute: .left, multiplier: 1, constant: 0))
//        scrollView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0))
        
        
        scrollView.yb_in(view: label, duration: .leftTop, isSafeArea: false, isAdd: true)
        scrollView.yb_setupAutoContentSize(rightView: label, rightMargin: 10)
    }
    
    /// 滚动试图 懒加载
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.orange
        return scrollView
    }()
}
