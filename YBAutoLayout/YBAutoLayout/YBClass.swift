//
//  YBClass.swift
//  weibo
//
//  Created by 王亚彬 on 2017/7/17.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBClass {
    // 获取空间名称
    class func spaceName() -> String {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let spaceName = infoDictionary["CFBundleName"] as? String else {
            assert(false, "命名空间获取失败")
            return ""
        }
        return spaceName
    }
    
    class func getClass (className: String) -> AnyClass? {
        let cn = spaceName() + "." + className
        guard let anyClass = NSClassFromString(cn) else {
            print("获取类失败")
            return nil;
        }
        return anyClass
    }
}
