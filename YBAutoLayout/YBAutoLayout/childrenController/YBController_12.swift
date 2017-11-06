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
        shwoTextArr = [YBCellModel(title: "1. 父试图的高度必须指定，因为snp的更新约束的方法前必须设定约束"),
                       YBCellModel(title: "2. 父试图的宽度会根据子试图的大小自行设定"),
                       YBCellModel(title: "2. 可以设定父试图距离右侧试图的边距")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_in(view: view_01,
                        duration: .leftCenter,
                        size: yb_layoutSize(width: 300, height: 70),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 0),
                        isAdd: true)
        
//        superView.yb_autoWidth(rightSubView: view_01, rightMargin: 10)
    }
}
