//
//  YBController_16.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/11/3.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_16: UIViewController {
    
    var xView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange

        let view_super = UIView()
        view_super.backgroundColor = UIColor.yb_random
        
        view.yb_in(view: view_super, duration: .leftTop, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(size: 10))
        xView = view_super
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.yb_random
        view.yb_in(view: btn, duration: .leftBottom, size: yb_layoutSize(size: 100), offset: yb_layoutOffset(size: 10))
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }
    
    @objc func btnClick() {
        let con = xView?.yb_getLayout(type: .height)
        print(con?.constant)
        con?.constant += 10
    }
}
