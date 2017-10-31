//
//  YBBaseController.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/9/29.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBBaseController: UITableViewController {
    
    // MARK: - 属性
    /// 说明文字
    var shwoTextArr = [YBCellModel]()
    
    let superView = YBView()
    let view_00 = YBView()
    let view_01 = YBView()
    let view_02 = YBView()
    let view_03 = YBView()
    let view_04 = YBView()
    let view_05 = YBView()
    let view_06 = YBView()
    let view_07 = YBView()
    let view_08 = YBView()
    let view_09 = YBView()
    let view_10 = YBView()
    let view_11 = YBView()
    let view_12 = YBView()
    let view_13 = YBView()
    let view_14 = YBView()
    let view_15 = YBView()
    let view_16 = YBView()
    let view_17 = YBView()
    let view_18 = YBView()
    let view_19 = YBView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 准备UI
        prepareUI()
    }
    
    /// 头试图 懒加载
    lazy var tableHeaderView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 400))
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    // MARK: - 准备UI
    /// 准备UI
    func prepareUI() {
        tableView.yb_register(cellWithClass: YBBaseCell.self)
        tableView.tableHeaderView = tableHeaderView
    }
}

// MARK: - Table view data source
extension YBBaseController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shwoTextArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.yb_dequeueReusableCell(withClass: YBBaseCell.self, for: indexPath)
        cell.model = shwoTextArr[indexPath.row]
        cell.model.yb_countCellHeight(cell: cell, bottomView: cell.showLabel, bottomMargin: 8)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return shwoTextArr[indexPath.row].yb_cellHeight()
    }
}

// MARK: - 自定义view
class YBView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.YB_Random()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
