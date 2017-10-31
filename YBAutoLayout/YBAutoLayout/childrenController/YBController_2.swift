//
//  YBController_2.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/9/29.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_2: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 可以自定义四周边距(上下左右边距)"),
                       YBCellModel(title: "2. 可以自定义子试图之间的间距（水平、垂直）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 300))
        
        superView.yb_fill(views: [view_00, view_01, view_02],
                          interval: 10, duration: .vertical,
                          edge: yb_layoutEdgeInsets(left: 10, top: 20, bottom: 30, right: 40))
    }
}
