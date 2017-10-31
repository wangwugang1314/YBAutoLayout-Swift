//
//  YBController_4.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_4: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 可以自定义四周边距（因为是高度自定义的所以这里对应的平铺的反方向的边距是没有用到的）"),
                       YBCellModel(title: "2. 可以自定义子试图之间的间距(水平、垂直)"),
                       YBCellModel(title: "3. 当子试图不够的情况下默认会使用UIView填充（隐藏）"),
                       YBCellModel(title: "4. item的宽度是根据父试图大小自动约束的"),
                       YBCellModel(title: "5. item的高度可以自定义，即便是超过父试图的高度"),
                       YBCellModel(title: "6. 可以自定义平铺方向12种，具体看枚举类型"),
                       YBCellModel(title: "7. 可以自定义单排平铺试图的个数")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 300))
        
        superView.yb_tile(views: [view_00, view_01, view_02, view_03, view_04],
                          itemHeight: 50,
                          direction: .top_leftToRight,
                          interval: YBLayoutInteracl(h: 10, v: 20),
                          cellInViews: 3,
                          edge: yb_layoutEdgeInsets(left: 10, top: 20, bottom: 30, right: 40))
    }
}
