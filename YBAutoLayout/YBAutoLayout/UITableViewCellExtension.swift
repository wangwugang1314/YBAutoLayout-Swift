//
//  UITableViewCellExtension.swift
//  tongFeng
//
//  Created by 王亚彬 on 2017/9/7.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

extension UITableViewCell {

    /// tableViewCell创建分割线
    ///
    /// - Parameters:
    ///   - lineWidth: 线宽
    ///   - lineColor: 线颜色
    ///   - leftInterval: 左边边距
    ///   - rightInterval: 右边边距
    /// - Returns: 返回分割线
    func yb_separator(lineWidth: CGFloat, lineColor: UIColor, leftInterval: CGFloat = 0, rightInterval: CGFloat = 0) -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = lineColor
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: leftInterval))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -rightInterval))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: lineWidth))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        return lineView
    }
}


