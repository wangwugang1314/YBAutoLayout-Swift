//
//  YBController_10.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_10: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 总共有10种布局方式（具体看枚举类型）"),
                       YBCellModel(title: "2. 使用方法：当某一个试图设定好布局后其他试图都希望有相同的布局的时候使用")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_out(view: view_00,
                         duration: .leftTop,
                         size: yb_layoutSize(width: 20, height: 20),
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
        
        view_00.yb_equal(views: [view_01, view_02, view_03], duration: .size)
    }
}
