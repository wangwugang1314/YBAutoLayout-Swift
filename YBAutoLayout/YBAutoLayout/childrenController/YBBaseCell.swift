//
//  YBBaseCell.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/9/29.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

// MARK: - 自定义cell
class YBBaseCell: UITableViewCell {
    
    // MARK: - 属性
    var model: YBCellModel! {
        didSet {
            showLabel.text = model.title
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 懒加载
    /// 内容试图
    lazy var showLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - 准备UI
    fileprivate func prepareUI() {
        contentView.yb_alignment(view: showLabel, duration: .inTop, interval: 8, sideInterval: 20)
    }
}
