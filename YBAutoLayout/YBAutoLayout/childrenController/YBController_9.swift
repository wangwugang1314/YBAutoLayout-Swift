//
//  YBController_9.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_9: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 注意这个方法是一个便捷的类方法，可以将数组里面的试图同时设置指定大小")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_out(view: view_00,
                         duration: .leftTop,
                         offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                         isAdd: true)
        superView.yb_out(view: view_01,
                         duration: .leftCenter,
                         offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                         isAdd: true)
        superView.yb_out(view: view_02,
                         duration: .leftBottom,
                         offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                         isAdd: true)
        superView.yb_out(view: view_03,
                         duration: .topLeft,
                         offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                         isAdd: true)
        
        UIView.yb_equalSize(views: [view_00, view_01, view_02, view_03], size: yb_layoutSize(width: 20, height: 30))
    }
}

