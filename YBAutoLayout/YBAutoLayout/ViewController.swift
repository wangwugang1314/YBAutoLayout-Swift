//
//  ViewController.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/9/29.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - 属性
    /// 数据源
    fileprivate let dataArr = [YBCellModel(title: "0. 单个子试图填充"),
                               YBCellModel(title: "1. 多个子试图填充(单排横向)"),
                               YBCellModel(title: "2. 多个子试图填充(单排纵向)"),
                               YBCellModel(title: "3. 平铺(多排,填充式)"),
                               YBCellModel(title: "4. 平铺(多排,指定cell高度)"),
                               YBCellModel(title: "5. 对其布局"),
                               YBCellModel(title: "6. 中心布局"),
                               YBCellModel(title: "7. 内部布局"),
                               YBCellModel(title: "8. 外部布局"),
                               YBCellModel(title: "9. 相等大小布局(便捷方法)"),
                               YBCellModel(title: "10. 部分约束相等布局(便捷方法)"),
                               YBCellModel(title: "11. 在两个试图之间的布局（不指定大小）"),
                               YBCellModel(title: "12. 在两个试图之间的布局（指定大小）"),
                               YBCellModel(title: "13. scrollView内容高度自动设置"),
                               YBCellModel(title: "14. scrollView内容宽度自动设置"),
                               YBCellModel(title: "15. cell高度自适应并且缓存高度"),
                               YBCellModel(title: "16. 测试")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        title = "自动布局"
        
        if #available(iOS 11.0, *) {
            viewRespectsSystemMinimumLayoutMargins = false
        } else {
            // Fallback on earlier versions
        }
    }
}

// MARK: - 准备UI
extension UITableViewController {
    
    /// 准备UI
    fileprivate func prepareUI() {
        tableView.yb_register(cellWithClass: YBBaseCell.self)
    }
}

// MARK: - tableView代理
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.yb_dequeueReusableCell(withClass: YBBaseCell.self, for: indexPath)
        cell.model = dataArr[indexPath.row]
        cell.model.yb_countCellHeight(cell: cell, bottomView: cell.showLabel, bottomMargin: 8)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataArr[indexPath.row].yb_cellHeight()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcStr = "YBController_\(indexPath.row)"
        let vcClass = YBClass.getClass(className: vcStr) as! UIViewController.Type
        let vc = vcClass.init()
        vc.title = dataArr[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
    }
}



