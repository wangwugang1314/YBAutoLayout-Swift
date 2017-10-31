//
//  YBController_5.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_5: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 一共有8种对齐方向，分为两大种内部跟外部（具体看枚举类型）"),
                       YBCellModel(title: "2. 可以设定宽度（默认值是nil不会设定宽度，当是不确定宽度的时候使用，比如多行UILabel）"),
                       YBCellModel(title: "3. 可以设定与参照试图之间的间距"),
                       YBCellModel(title: "4. 可以设定与参照试图两边的边距"),
                       YBCellModel(title: "5. 可以设置是否添加到参照试图（默认是添加的，比如说参照外部来对齐就不需要添加，但是在布局前必须要手动添加到父试图）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_alignment(view: view_00, duration: .inTop, width: 20, interval: 0, sideInterval: 0, isAdd: true)
        view.addSubview(view_01)
        superView.yb_alignment(view: view_01, duration: .outTop, width: 20, interval: 10, sideInterval: 10, isAdd: false)
        superView.yb_alignment(view: view_02, duration: .inBottom, width: 30, interval: 20, sideInterval: 20, isAdd: true)
        view.addSubview(view_03)
        superView.yb_alignment(view: view_03, duration: .outBottom, width: 30, interval: 10, sideInterval: 20, isAdd: false)
    }
}
