//
//  YBController_6.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_6: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 可以布局到参照试图的正中间"),
                       YBCellModel(title: "2. 可以设定大小（默认是nil 不会设定大小）"),
                       YBCellModel(title: "3. 可以设定水平与垂直偏移（默认是nil 在正中间）"),
                       YBCellModel(title: "4. 可以设置是否添加到参照试图（默认是添加的，也可以设置false, 但是在布局前必须要手动添加到父试图）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        tableHeaderView.yb_center(view: view_00,
                                  size: yb_layoutSize(width: 100, height: 100),
                                  offset: yb_layoutOffset(horizontal: 10, vertical: 20),
                                  isAdd: true)
    }
}
