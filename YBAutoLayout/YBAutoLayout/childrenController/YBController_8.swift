//
//  YBController_8.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_8: YBBaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shwoTextArr = [YBCellModel(title: "1. 总共有16种布局方式（具体看枚举类型）"),
                       YBCellModel(title: "2. 可以设定大小（默认是nil 不会设定大小）"),
                       YBCellModel(title: "3. 可以设定水平与垂直偏移（默认是nil 不偏移）"),
                       YBCellModel(title: "4. 可以设置是否添加到参照试图（默认是不添加的，也可以设置false, 但是在布局前必须要手动添加到父试图）")]
    }
    
    /// 准备UI
    override func prepareUI() {
        super.prepareUI()
        tableHeaderView.yb_center(view: superView, size: yb_layoutSize(size: 250))
        
        superView.yb_out(view: view_00,
                        duration: .leftTop,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_01,
                        duration: .leftCenter,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_02,
                        duration: .leftBottom,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_03,
                        duration: .topLeft,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_04,
                        duration: .topCenter,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_05,
                        duration: .topRight,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_06,
                        duration: .rightTop,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_07,
                        duration: .rightCenter,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_08,
                        duration: .rightBottom,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_09,
                        duration: .bottomLeft,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_10,
                        duration: .bottomCenter,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_11,
                        duration: .bottomRight,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 10, vertical: 10),
                        isAdd: true)
        superView.yb_out(view: view_12,
                        duration: .angleLeftTop,
                        size: yb_layoutSize(width: 20, height: 20),
                        offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                        isAdd: true)
        superView.yb_out(view: view_13,
                         duration: .angleRightTop,
                         size: yb_layoutSize(width: 20, height: 20),
                         offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                         isAdd: true)
        superView.yb_out(view: view_14,
                         duration: .angleLeftBottom,
                         size: yb_layoutSize(width: 20, height: 20),
                         offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                         isAdd: true)
        superView.yb_out(view: view_15,
                         duration: .angleRightBottom,
                         size: yb_layoutSize(width: 20, height: 20),
                         offset: yb_layoutOffset(horizontal: 0, vertical: 0),
                         isAdd: true)
    }
}
