//
//  YBController_16.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/11/3.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_16: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange

        let view_super = UIView()
        view_super.backgroundColor = UIColor.yb_random
        
        view.yb_fill(view: view_super)
        
        let view_0 = UIView()
        view_0.backgroundColor = UIColor.yb_random
        view.addSubview(view_0)
        
        view_0.snp.makeConstraints { (make) in
            make.top.left.equalTo(view)
            make.size.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
}
