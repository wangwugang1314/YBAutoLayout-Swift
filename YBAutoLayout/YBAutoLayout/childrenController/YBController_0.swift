//
//  YBController_0.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/9/29.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_0: YBBaseController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 可以自定义填充的边距(上下左右边距)"),
                       YBCellModel(title: "2. 可以自动添加到父试图，也可以自定义添加到指定试图（平铺的试图并不一定是添加到父试图上）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 300))
        
        superView.yb_fill(view: view_00,
                          edge: yb_layoutEdgeInsets(left: 10, top: 20, bottom: 30, right: 40),
                          isAdd: true)
    }
}

