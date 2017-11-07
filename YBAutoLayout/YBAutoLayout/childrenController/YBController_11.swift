//
//  YBController_11.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_11: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 三个试图必须都添加到父试图中（不需要时同一个父试图）"),
                       YBCellModel(title: "2. 有水平跟垂直两种方向排布（默认水平）"),
                       YBCellModel(title: "3. 对齐的方式可以有9中（具体看枚举）"),
                       YBCellModel(title: "4. 在对其的基础上可以进行单方向的平移"),
                       YBCellModel(title: "5. 可以设置与两边试图的间距（默认0）"),
                       YBCellModel(title: "6. 可以设置对其具体是参照第一个试图还是第二个试图（默认是第一个）"),
                       YBCellModel(title: "7. 可以设置与对其方式反方向的一个宽度的大小")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_in(view: view_00, duration: .leftCenter, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(horizontal: 20, vertical: 50))
        tableHeaderView.yb_in(view: view_01, duration: .rightCenter, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(horizontal: -20, vertical: -50))
        
        tableHeaderView.addSubview(view_03)
        view_03.yb_between(direction: .horizon,
                           oneView: view_00,
                           oneInterval: 10,
                           twoView: view_01,
                           twoInterval: 10,
                           referenceOne: false,
                           referenceDirection: .three_three,
                           width: 100,
                           offset: 10)
    }
}
