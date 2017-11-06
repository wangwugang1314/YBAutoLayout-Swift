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
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    // MARK: - 准备UI
    fileprivate func prepareUI() {
        if #available(iOS 11.0, *) {
            contentView.directionalLayoutMargins.leading = 100
            showLabel.directionalLayoutMargins.leading = 100
            showLabel.translatesAutoresizingMaskIntoConstraints = false
        } else {
            // Fallback on earlier versions
        }
        
        contentView.addSubview(showLabel)
        
        contentView.addConstraint(NSLayoutConstraint(item: showLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 8))
        contentView.addConstraint(NSLayoutConstraint(item: showLabel, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 8))
        contentView.addConstraint(NSLayoutConstraint(item: showLabel, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: -8))
        
//        contentView.yb_alignment(view: showLabel, duration: .inTop, interval: 8, sideInterval: 20)
        
    }
}
