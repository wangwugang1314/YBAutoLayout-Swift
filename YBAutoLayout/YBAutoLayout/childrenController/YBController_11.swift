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
        shwoTextArr = [YBCellModel(title: "1. 父试图的高度必须指定，因为snp的更新约束的方法前必须设定约束"),
                       YBCellModel(title: "2. 父试图的高度会根据子试图的大小自行设定"),
                       YBCellModel(title: "2. 可以设定父试图距离底部试图的边距")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_in(view: view_01,
                        duration: .centerTop,
                        size: yb_layoutSize(width: 70, height: 300),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 10),
                        isAdd: true)
        
//        superView.yb_autoHeight(bottomSubView: view_01, bottomMargin: 10)
    }
}
