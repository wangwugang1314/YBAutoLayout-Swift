//
//  YBController_12.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_12: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 三个试图必须都添加到父试图中（不需要必须是同一个父试图）"),
                       YBCellModel(title: "2. 有水平跟垂直两种方向排布（默认水平）"),
                       YBCellModel(title: "3. 对齐的方式可以有9中（具体看枚举）"),
                       YBCellModel(title: "4. 在对其布局的基础上进行平移（水平、垂直）"),
                       YBCellModel(title: "5. 可以设置试图的大小"),
                       YBCellModel(title: "6. 可以设置对其具体是参照第一个试图还是第二个试图（默认是第一个）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_in(view: view_00, duration: .centerTop, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(horizontal: 20, vertical: 30))
        tableHeaderView.yb_in(view: view_01, duration: .centerBottom, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(horizontal: -20, vertical: -30))
        
        tableHeaderView.addSubview(view_03)
        
        view_03.yb_between(direction: .vertical,
                           oneView: view_00,
                           twoView: view_01,
                           size: yb_layoutSize(size: 50),
                           referenceOne: true,
                           referenceDirection: .one_two,
                           offset: yb_layoutOffset(horizontal: 0, vertical: 0))
    }
}
