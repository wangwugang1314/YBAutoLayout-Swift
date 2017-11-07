//
//  YBLayout-Swift.swift
//
//  Created by FuYun on 2016/12/10.
//  Copyright © 2016年 FuYun. All rights reserved.
//

import UIKit

/// 布局方向
///
/// - horizon: 水平
/// - vertical: 垂直
enum YBLayoutDuration {
    case horizon
    case vertical
}

/// 参照方向（具体自己体会）
enum YBLayoutBetweenReference {
    case one_one
    case one_two
    case one_three
    case two_one
    case two_two
    case two_three
    case three_one
    case three_two
    case three_three
}

/// 对齐方式
///
/// - inTop: 内部-上边
/// - inLeft: 内部-左边
/// - inBottom: 内部-底边
/// - inRight: 内部-右边
/// - outTop: 外部-上边
/// - outLeft: 外部-左边
/// - outBottom: 外部-底边
/// - outRight: 外部-右边
enum YBLayoutAlignment {
    case inTop
    case inLeft
    case inBottom
    case inRight
    case outTop
    case outLeft
    case outBottom
    case outRight
}

/// 内部布局
///
/// - leftTop: 左边-顶部
/// - leftcenter: 左边-中心
/// - leftBottom: 左边-下边
/// - centerTop: 中心-顶部
/// - centerCenter: 中心-中心
/// - centerBottom: 中心-下边
/// - rightTop: 右边-顶部
/// - rightCenter: 右边-中心
/// - rightBottom: 右边-下边
enum YBLayoutIn {
    case leftTop
    case leftCenter
    case leftBottom
    case centerTop
    case centerCenter
    case centerBottom
    case rightTop
    case rightCenter
    case rightBottom
}

/// 外部布局
///
/// - topLeft: 顶部-左边
/// - topCenter: 顶部-中心
/// - topRight: 顶部-右边
/// - bottomLeft: 底部-左边
/// - bottomCenter: 底部-中心
/// - bottomRight: 底部-右边
/// - leftTop: 左边-顶部
/// - leftCenter: 左边-中心
/// - leftBottom: 左边-底部
/// - rightTop: 右边-顶部
/// - rightCenter: 右边-中心
/// - rightBottom: 右边-底部
/// - angleLeftTop: 角-左边-顶部
/// - angleLeftBottom: 角-左边-底部
/// - angleRightTop: 角-右边-顶部
/// - angleRightBottom: 角-右边-底部
enum YBLayoutOut {
    case topLeft
    case topCenter
    case topRight
    case bottomLeft
    case bottomCenter
    case bottomRight
    case leftTop
    case leftCenter
    case leftBottom
    case rightTop
    case rightCenter
    case rightBottom
    case angleLeftTop
    case angleLeftBottom
    case angleRightTop
    case angleRightBottom
}


/// 相等布局
///
/// - width: 宽度
/// - height: 高度
/// - size: 大小
/// - centerX: 中心X
/// - centerY: 中心Y
/// - center: 中心
/// - left: 左边
/// - right: 右边
/// - top: 顶部
/// - bottom: 底部
enum YBLayoutEqual {
    case width
    case height
    case size
    case centerX
    case centerY
    case center
    case left
    case right
    case top
    case bottom
}

/// 地板砖式的平铺
///
/// - top_leftToRight: 顶部-从左到右
/// - top_rightToLeft: 顶部-从右到左
/// - bottom_leftToRight: 底部-从左到右
/// - bottom_rightToLeft: 底部-从右到左
/// - left_topToBottom: 左边-从上到下
/// - left_bottomToTop: 左边-从下到上
/// - right_topToBottom: 右边-从上到下
/// - right_bottomToTop: 右边-从下到上
enum YBLayoutTileType: Int {
    case top_leftToRight = 0
    case top_rightToLeft = 1
    case bottom_leftToRight = 2
    case bottom_rightToLeft = 3
    case left_topToBottom = 4
    case left_bottomToTop = 5
    case right_topToBottom = 6
    case right_bottomToTop = 7
}

/// 自定义间距
struct YBLayoutInteracl {
    var h: CGFloat
    var v: CGFloat
    
    init(h: CGFloat = 0, v: CGFloat = 0) {
        self.h = h
        self.v = v
    }
    
    init(interval: CGFloat) {
        self.h = interval
        self.v = interval
    }
}

/// 自定义size结构体
struct yb_layoutSize {
    var width: CGFloat?
    var height: CGFloat?
    
    init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }
    
    init(size: CGFloat) {
        self.width = size
        self.height = size
    }
}

/// 自定义offset结构体
struct yb_layoutOffset {
    var horizontal: CGFloat = 0
    var vertical: CGFloat = 0
    
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    init(size: CGFloat) {
        self.horizontal = size
        self.vertical = size
    }
}


/// 自定义边距
struct yb_layoutEdgeInsets {
    var left: CGFloat = 0
    var top: CGFloat = 0
    var bottom: CGFloat = 0
    var right: CGFloat = 0
    
    init(left: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.left = left
        self.top = top
        self.bottom = bottom
        self.right = right
    }
    
    init(horizon: CGFloat, vertical: CGFloat) {
        self.left = horizon
        self.top = vertical
        self.bottom = vertical
        self.right = horizon
    }
    
    init(border: CGFloat) {
        self.left = border
        self.top = border
        self.bottom = border
        self.right = border
    }
}


// MARK: - 私有方法
extension UIView {
    
    /// 添加到父试图
    ///
    /// - Parameters:
    ///   - view: 子试图
    ///   - isAdd: 是否添加
    /// - Returns: 返回父试图
    fileprivate func addToSuperView(subView: UIView, isAdd: Bool) -> UIView {
        let addSuperView = subView.superview
        // 禁止Autoresizing
        subView.translatesAutoresizingMaskIntoConstraints = false
        if isAdd {
            if addSuperView == nil {
                addSubview(subView)
            } else if addSuperView == self {
                print("已经添加到当前试图，已经忽略重复添加动作")
            } else {
                assert(false, "不允许重复添加到不同的父试图")
            }
        } else {
            if addSuperView == nil {
                assert(false, "试图必须添加到父试图才能进行约束")
            }
        }
        // 这个理一定是添加到父试图上的
        return subView.superview!
    }
    
    /// 根据是否是安全区域返回view
    ///
    /// - Parameter isSafeArea: 是否需要安全区域
    /// - Returns: 返回的view
    private func yb_layoutView(isSafeArea: Bool) -> Any {
        if #available(iOS 11.0, *) {
            return isSafeArea ? self.safeAreaLayoutGuide : self
        } else {
            return self
        }
    }
}

// MARK: - 平铺
extension UIView {
    
    /// 单个子试图平铺
    ///
    /// - Parameters:
    ///   - view: 子试图
    ///   - edge: 子试图与父试图的边距
    ///   - isSafeArea: 是否是安全区域
    ///   - isAdd: 是否添加到父试图(默认添加)
    func yb_fill(view: UIView, edge: yb_layoutEdgeInsets = yb_layoutEdgeInsets(), isSafeArea: Bool = false, isAdd: Bool = true) {
        let superView = addToSuperView(subView: view, isAdd: isAdd)
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        superView.yb_addConstraint(item: view,
                                   attribute: .left,
                                   toItem: yb_layoutView,
                                   toAttribute: .left,
                                   constant: edge.left)
        superView.yb_addConstraint(item: view,
                                   attribute: .top,
                                   toItem: yb_layoutView,
                                   toAttribute: .top,
                                   constant: edge.top)
        superView.yb_addConstraint(item: view,
                                   attribute: .right,
                                   toItem: yb_layoutView,
                                   toAttribute: .right,
                                   constant: -edge.right)
        superView.yb_addConstraint(item: view,
                                   attribute: .bottom,
                                   toItem: yb_layoutView,
                                   toAttribute: .bottom,
                                   constant: -edge.bottom)
    }
    
    /// 多个子试图平铺布局
    ///
    /// - Parameters:
    ///   - views: 子试图数组
    ///   - interval: 自试图之间的间隔
    ///   - duration: 平铺方向
    ///   - edge: 子试图与俯视图的边距(默认添加)
    ///   - isSafeArea: 是否是安全区域
    func yb_fill(views: [UIView], interval: CGFloat = 0, duration: YBLayoutDuration = .horizon, edge: yb_layoutEdgeInsets = yb_layoutEdgeInsets(), isSafeArea: Bool = false) {
        if views.count == 1 {
            yb_fill(view: views[0], edge: edge, isSafeArea: isSafeArea, isAdd: true)
        } else {
            // ================= 根据是否是安全区域获取数据 ==================
            let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
            // ===========================================================
            // 设置
            for (index, view) in views.enumerated() {
                let superView = addToSuperView(subView: view, isAdd: true)
                if duration == .horizon {
                    if index == 0 {
                        superView.yb_addConstraint(item: view,
                                                   attribute: .left,
                                                   toItem: yb_layoutView,
                                                   toAttribute: .left,
                                                   constant: edge.left)
                    } else {
                        let beforeView = views[index - 1]
                        let firstView = views.first!
                        if index == views.count - 1 {
                            superView.yb_addConstraint(item: view,
                                                       attribute: .right,
                                                       toItem: yb_layoutView,
                                                       toAttribute: .right,
                                                       constant: -edge.right)
                        }
                        superView.yb_addConstraint(item: view,
                                                   attribute: .left,
                                                   toItem: beforeView,
                                                   toAttribute: .right,
                                                   constant: interval)
                        superView.yb_addConstraint(item: view,
                                                   attribute: .width,
                                                   toItem: firstView,
                                                   toAttribute: .width,
                                                   constant: 0)
                    }
                    superView.yb_addConstraint(item: view,
                                               attribute: .top,
                                               toItem: yb_layoutView,
                                               toAttribute: .top,
                                               constant: edge.top)
                    superView.yb_addConstraint(item: view,
                                               attribute: .bottom,
                                               toItem: yb_layoutView,
                                               toAttribute: .bottom,
                                               constant: -edge.bottom)
                } else {
                    if index == 0 {
                        superView.yb_addConstraint(item: view,
                                                   attribute: .top,
                                                   toItem: yb_layoutView,
                                                   toAttribute: .top,
                                                   constant: edge.top)
                    } else {
                        let beforeView = views[index - 1]
                        let firstView = views.first!
                        if index == views.count - 1 {
                            superView.yb_addConstraint(item: view,
                                                       attribute: .bottom,
                                                       toItem: yb_layoutView,
                                                       toAttribute: .bottom,
                                                       constant: -edge.bottom)
                        }
                        superView.yb_addConstraint(item: view,
                                                   attribute: .top,
                                                   toItem: beforeView,
                                                   toAttribute: .bottom,
                                                   constant: interval)
                        superView.yb_addConstraint(item: view,
                                                   attribute: .height,
                                                   toItem: firstView,
                                                   toAttribute: .height,
                                                   constant: 0)
                    }
                    superView.yb_addConstraint(item: view,
                                               attribute: .left,
                                               toItem: yb_layoutView,
                                               toAttribute: .left,
                                               constant: edge.left)
                    superView.yb_addConstraint(item: view,
                                               attribute: .right,
                                               toItem: yb_layoutView,
                                               toAttribute: .right,
                                               constant: -edge.right)
                    
                }
            }
        }
    }
    
}

// MARK: - 填充
extension UIView {
    
    /// 填充(地板砖一样平铺，不会再安全区域设置)
    ///
    /// - Parameters:
    ///   - views: 子试图
    ///   - direction: 平铺方向
    ///   - interval: 试图之间的间隔
    ///   - sections: 分组数
    ///   - edge: 边距
    func yb_tile(views: [UIView], direction: YBLayoutTileType = .top_leftToRight, interval: YBLayoutInteracl = YBLayoutInteracl(), cellInViews: Int = 1, edge: yb_layoutEdgeInsets = yb_layoutEdgeInsets()) {
        // 需要平铺的子试图-转化成二位数组(添加自动填充的子试图)
        var allSubViews = [[UIView]]()
        for startCellIndex in stride(from: 0, to: views.count, by: cellInViews)  {
            var section = [UIView]()
            // 分组里面的view数组
            if startCellIndex + cellInViews <= views.count {
                section = (views as NSArray).subarray(with: NSRange(location: startCellIndex,
                                                                    length: cellInViews)) as! [UIView]
            } else {
                let chaCount = startCellIndex + cellInViews - views.count
                section = (views as NSArray).subarray(with: NSRange(location: startCellIndex,
                                                                    length: cellInViews - chaCount )) as! [UIView]
                for _ in 0..<chaCount {
                    section.append(UIView())
                }
            }
            allSubViews.append(section)
        }
        // 根据类型更新数据位置
        var tileViews = [[UIView]]()
        switch direction {
        case .top_leftToRight, .left_topToBottom:
            tileViews = allSubViews
        case .top_rightToLeft, .left_bottomToTop:
            for section in allSubViews {
                tileViews.append(section.reversed())
            }
        case .bottom_leftToRight, .right_topToBottom:
            tileViews = allSubViews.reversed()
        case .bottom_rightToLeft, .right_bottomToTop:
            for section in allSubViews.reversed() {
                tileViews.append(section.reversed())
            }
        }
        
        // 平铺试图
        if direction.rawValue <= YBLayoutTileType.bottom_rightToLeft.rawValue {
            var sectionViews = [UIView]()
            for section in tileViews {
                let sectionView = UIView()
                sectionView.yb_fill(views: section,
                                    interval: interval.h,
                                    duration: .horizon,
                                    edge: yb_layoutEdgeInsets(left: edge.left,
                                                              top: 0,
                                                              bottom: 0,
                                                              right: edge.right),
                                    isSafeArea: false)
                sectionViews.append(sectionView)
            }
            yb_fill(views: sectionViews,
                    interval: interval.v,
                    duration: .vertical,
                    edge: yb_layoutEdgeInsets(left: 0, top: edge.top, bottom: edge.bottom, right: 0),
                    isSafeArea: false)
        } else {
            var sectionViews = [UIView]()
            for section in tileViews {
                let sectionView = UIView()
                sectionView.yb_fill(views: section,
                                    interval: interval.v,
                                    duration: .vertical,
                                    edge: yb_layoutEdgeInsets(left: 0,
                                                              top: edge.top,
                                                              bottom: edge.bottom,
                                                              right: 0),
                                    isSafeArea: false)
                sectionViews.append(sectionView)
            }
            yb_fill(views: sectionViews,
                    interval: interval.h,
                    duration: .horizon,
                    edge: yb_layoutEdgeInsets(left: edge.left, top: 0, bottom: 0, right: edge.right),
                    isSafeArea: false)
        }
    }
    
    /// 平铺（指定Item的高度，不会再安全区域设置）
    ///
    /// - Parameters:
    ///   - views: 需要平铺的子试图
    ///   - itemHeight: 子试图的高度
    ///   - direction: 平铺方向
    ///   - interval: 子试图之间的间隔
    ///   - cellInViews: 一行子试图的个数
    ///   - edge: 边距(下边距是无效的)
    func yb_tile(views: [UIView], itemHeight: CGFloat, direction: YBLayoutTileType = .top_leftToRight, interval: YBLayoutInteracl = YBLayoutInteracl(), cellInViews: Int = 1, edge: yb_layoutEdgeInsets = yb_layoutEdgeInsets()) {
        // 计算行的个数
        let sectionNum = (views.count + cellInViews - 1) / cellInViews
        // 计算背景试图的高度
        var bgViewHeight: CGFloat = 0
        let sectionFloatNum: CGFloat = CGFloat(sectionNum)
        let bgView = UIView()
        var inEdit: yb_layoutEdgeInsets
        switch direction {
        case .top_leftToRight, .top_rightToLeft:
            inEdit = yb_layoutEdgeInsets(left: edge.left, top: 0, bottom: edge.bottom, right: edge.right)
            bgViewHeight = edge.bottom + itemHeight * sectionFloatNum + interval.v * (sectionFloatNum - 1)
            yb_alignment(view: bgView, duration: .inTop, width: bgViewHeight, interval: edge.top)
        case .bottom_rightToLeft, .bottom_leftToRight:
            bgViewHeight = edge.top + itemHeight * sectionFloatNum + interval.v * (sectionFloatNum - 1)
            inEdit = yb_layoutEdgeInsets(left: edge.left, top: edge.top, bottom: 0, right: edge.right)
            yb_alignment(view: bgView, duration: .inBottom, width: bgViewHeight, interval: edge.bottom)
        case .left_bottomToTop, .left_topToBottom:
            bgViewHeight = edge.right + itemHeight * sectionFloatNum + interval.h * (sectionFloatNum - 1)
            inEdit = yb_layoutEdgeInsets(left: 0, top: edge.top, bottom: edge.bottom, right: edge.right)
            yb_alignment(view: bgView, duration: .inLeft, width: bgViewHeight, interval: edge.left)
        case .right_bottomToTop, .right_topToBottom:
            bgViewHeight = edge.left + itemHeight * sectionFloatNum + interval.h * (sectionFloatNum - 1)
            inEdit = yb_layoutEdgeInsets(left: edge.left, top: edge.top, bottom: edge.bottom, right: 0)
            yb_alignment(view: bgView, duration: .inRight, width: bgViewHeight, interval: edge.right)
        }
        bgView.yb_tile(views: views,
                       direction: direction,
                       interval: interval,
                       cellInViews: cellInViews,
                       edge: inEdit)
    }
}

// MARK: - 基本布局
extension UIView {
    
    /// 对齐布局(self: 参照试图)
    ///
    /// - Parameters:
    ///   - view: 需要布局的试图
    ///   - duration: 参照方向
    ///   - width: 需要布局试图的宽度
    ///   - interval: 布局试图与参照试图的间隔
    ///   - sideInterval: 布局试图与参照试图的边距
    ///   - Parameter isSafeArea: 是否需要安全区域
    ///   - isAdd: 是否添加到参照试图上(默认添加)
    func yb_alignment(view: UIView, duration: YBLayoutAlignment, width: CGFloat? = nil, interval: CGFloat = 0, sideInterval: CGFloat = 0, isSafeArea: Bool = false, isAdd: Bool = true) {
        let superView = addToSuperView(subView: view, isAdd: isAdd)
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        // 设置宽度与边距
        switch duration {
        case .inTop, .inBottom, .outTop, .outBottom:
            if let width = width {
                superView.yb_addConstraint(item: view,
                                           attribute: .height,
                                           toItem: nil,
                                           toAttribute: .height,
                                           constant: width)
            }
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: sideInterval)
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: -sideInterval)
        default:
            if let width = width {
                superView.yb_addConstraint(item: view,
                                           attribute: .width,
                                           toItem: nil,
                                           toAttribute: .width,
                                           constant: width)
            }
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: sideInterval)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: -sideInterval)
        }
        // 设置位置
        switch duration {
        case .inTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: interval)
        case .inLeft:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: interval)
        case .inRight:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: -interval)
        case .inBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: -interval)
        case .outTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: -interval)
        case .outLeft:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: -interval)
        case .outRight:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: interval)
        case .outBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: interval)
        }
    }
    
    
    /// 中心布局
    ///
    /// - Parameters:
    ///   - view: 需要布局的试图
    ///   - size: 需要布局试图的大小
    ///   - offset: 需要布局试图的偏移
    ///   - Parameter isSafeArea: 是否需要安全区域
    ///   - isAdd: 是否添加到参照试图(默认添加)
    func yb_center(view: UIView, size: yb_layoutSize? = nil, offset: yb_layoutOffset = yb_layoutOffset(), isSafeArea: Bool = false, isAdd: Bool = true) {
        let superView = addToSuperView(subView: view, isAdd: isAdd)
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        superView.yb_addConstraint(item: view,
                                   attribute: .centerX,
                                   toItem: yb_layoutView,
                                   toAttribute: .centerX,
                                   constant: offset.horizontal)
        superView.yb_addConstraint(item: view,
                                   attribute: .centerY,
                                   toItem: yb_layoutView,
                                   toAttribute: .centerY,
                                   constant: offset.vertical)
        // 设置大小
        view.yb_setSize(size: size)
    }
    
    
    /// 内部布局
    ///
    /// - Parameters:
    ///   - view: 需要布局的试图
    ///   - duration: 布局方向
    ///   - size: 需要布局试图的大小
    ///   - offset: 需要布局试图的偏移
    ///   - Parameter isSafeArea: 是否需要安全区域
    ///   - isAdd: 是否添加到参照试图(默认添加)
    func yb_in(view: UIView, duration: YBLayoutIn, size: yb_layoutSize? = nil, offset: yb_layoutOffset = yb_layoutOffset(), isSafeArea: Bool = false, isAdd: Bool = true) {
        let superView = addToSuperView(subView: view, isAdd: isAdd)
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        switch duration {
        case .leftTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .leftCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerY,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerY,
                                       constant: offset.vertical)
        case .leftBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .centerTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .centerX,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerX,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .centerCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .centerX,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerX,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerY,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerY,
                                       constant: offset.vertical)
        case .centerBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .centerX,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerX,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .rightTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .rightCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerY,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerY,
                                       constant: offset.vertical)
        case .rightBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        }
        // 设置大小
        view.yb_setSize(size: size)
    }
    
    
    /// 外部布局
    ///
    /// - Parameters:
    ///   - view: 需要布局的子试图
    ///   - duration: 布局方向
    ///   - size: 需要布局试图的大小
    ///   - offset: 偏移量
    ///   - Parameter isSafeArea: 是否需要安全区域
    ///   - isAdd: 是否添加到参照试图(默认不添加)
    func yb_out(view: UIView, duration: YBLayoutOut, size: yb_layoutSize? = nil, offset: yb_layoutOffset = yb_layoutOffset(), isSafeArea: Bool = false, isAdd: Bool = false) {
        let superView = addToSuperView(subView: view, isAdd: isAdd)
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        switch duration {
        case .angleLeftTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .angleRightTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .angleLeftBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .angleRightBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .topLeft:
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
        case .topCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerX,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerX,
                                       constant: offset.horizontal)
        case .topRight:
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
        case .leftTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .leftCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerY,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerY,
                                       constant: offset.vertical)
        case .leftBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .rightTop:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .top,
                                       constant: offset.vertical)
        case .rightCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerY,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerY,
                                       constant: offset.vertical)
        case .rightBottom:
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
            superView.yb_addConstraint(item: view,
                                       attribute: .bottom,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
        case .bottomLeft:
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .left,
                                       toItem: yb_layoutView,
                                       toAttribute: .left,
                                       constant: offset.horizontal)
        case .bottomCenter:
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .centerX,
                                       toItem: yb_layoutView,
                                       toAttribute: .centerX,
                                       constant: offset.horizontal)
        case .bottomRight:
            superView.yb_addConstraint(item: view,
                                       attribute: .top,
                                       toItem: yb_layoutView,
                                       toAttribute: .bottom,
                                       constant: offset.vertical)
            superView.yb_addConstraint(item: view,
                                       attribute: .right,
                                       toItem: yb_layoutView,
                                       toAttribute: .right,
                                       constant: offset.horizontal)
        }
        // 设置大小
        view.yb_setSize(size: size)
    }
    
    /// 介于两者之间(不可以指定大小，宽度或者高度是有两边试图决定的、另外的一个高度或者宽度可以指定)
    ///
    /// - Parameters:
    ///   - direction: 方向
    ///   - oneView: 第一个试图
    ///   - oneInterval: 第一个试图间隔
    ///   - twoView: 第二个试图
    ///   - twoInterval: 第二个试图间隔
    ///   - referenceOne: 参照试图
    ///   - referenceDirection: 参照方向
    ///   - width: 宽度
    ///   - offset: 单方面的平移
    func yb_between(direction: YBLayoutDuration = .horizon, oneView: UIView, oneInterval: CGFloat = 0, twoView: UIView, twoInterval: CGFloat = 0, referenceOne: Bool = true, referenceDirection: YBLayoutBetweenReference = .two_two, width: CGFloat? = nil, offset: CGFloat = 0) {
        // 判断全部添加到父试图
        guard superview != nil, oneView.superview != nil, twoView.superview != nil else {
            assert(false, "必须全部添加到父试图才能进行约束")
            return
        }
        // 去除所有的Autoresizing
        translatesAutoresizingMaskIntoConstraints = false
        oneView.translatesAutoresizingMaskIntoConstraints = false
        twoView.translatesAutoresizingMaskIntoConstraints = false
        // 获取共同的父试图
        guard let saveSuperView = yb_findSaveSuperView(others: [oneView, twoView]) else {
            assert(false, "没有找到相同父试图")
            return
        }
        // 设置约束
        let referenceView = referenceOne ? oneView : twoView
        switch direction {
        case .horizon:
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .left,
                                           toItem: oneView,
                                           toAttribute: .right,
                                           constant: oneInterval)
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .right,
                                           toItem: twoView,
                                           toAttribute: .left,
                                           constant: -twoInterval)
            if let height = width {
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .height,
                                               toItem: nil,
                                               toAttribute: .height,
                                               constant: height)
            }
            switch referenceDirection {
            case .one_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: referenceView,
                                               toAttribute: .top,
                                               constant: offset)
            case .one_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: referenceView,
                                               toAttribute: .top,
                                               constant: offset)
            case .one_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: referenceView,
                                               toAttribute: .top,
                                               constant: offset)
            case .two_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: referenceView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .two_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: referenceView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .two_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: referenceView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .three_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: referenceView,
                                               toAttribute: .bottom,
                                               constant: offset)
            case .three_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: referenceView,
                                               toAttribute: .bottom,
                                               constant: offset)
            case .three_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: referenceView,
                                               toAttribute: .bottom,
                                               constant: offset)
            }
        default:
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .top,
                                           toItem: oneView,
                                           toAttribute: .bottom,
                                           constant: oneInterval)
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .bottom,
                                           toItem: twoView,
                                           toAttribute: .top,
                                           constant: -twoInterval)
            if let width = width {
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .width,
                                               toItem: nil,
                                               toAttribute: .width,
                                               constant: width)
            }
            switch referenceDirection {
            case .one_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: referenceView,
                                               toAttribute: .left,
                                               constant: offset)
            case .one_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: referenceView,
                                               toAttribute: .left,
                                               constant: offset)
            case .one_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: referenceView,
                                               toAttribute: .left,
                                               constant: offset)
            case .two_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: referenceView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .two_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: referenceView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .two_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: referenceView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .three_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: referenceView,
                                               toAttribute: .right,
                                               constant: offset)
            case .three_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: referenceView,
                                               toAttribute: .right,
                                               constant: offset)
            case .three_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: referenceView,
                                               toAttribute: .right,
                                               constant: offset)
            }
        }
    }
    
    /// 介于两者之间(可以指定大小)
    ///
    /// - Parameters:
    ///   - direction: 方向
    ///   - oneView: 第一个试图
    ///   - twoView: 第二个试图
    ///   - size: 大小
    ///   - referenceOne: 是否参照第一个试图
    ///   - referenceDirection: 参照位置
    ///   - offset: 单方向平移
    func yb_between(direction: YBLayoutDuration = .horizon, oneView: UIView, twoView: UIView, size: yb_layoutSize = yb_layoutSize(), referenceOne: Bool = true, referenceDirection: YBLayoutBetweenReference = .two_two, offset: CGFloat = 0) {
        // 判断全部添加到父试图
        guard superview != nil, oneView.superview != nil, twoView.superview != nil else {
            assert(false, "必须全部添加到父试图才能进行约束")
            return
        }
        // 去除所有的Autoresizing
        translatesAutoresizingMaskIntoConstraints = false
        oneView.translatesAutoresizingMaskIntoConstraints = false
        twoView.translatesAutoresizingMaskIntoConstraints = false
        // 获取共同的父试图
        guard let saveSuperView = yb_findSaveSuperView(others: [oneView, twoView]) else {
            assert(false, "没有找到相同父试图")
            return
        }
        // 设置约束
        let referenceView = referenceOne ? oneView : twoView
        // 设置虚拟站位试图（因为如果适配iOS8不能使用UILayoutGuide）
        let placeholderView = UIView()
        placeholderView.isHidden = true
        placeholderView.translatesAutoresizingMaskIntoConstraints = false
        saveSuperView.addSubview(placeholderView)
        
        switch direction {
        case .horizon:
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .left,
                                           toItem: oneView,
                                           toAttribute: .right,
                                           constant: 0)
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .right,
                                           toItem: twoView,
                                           toAttribute: .left,
                                           constant: 0)
            // 设置中间试图的位置
            var placeholderLayputY = NSLayoutAttribute.top
            switch referenceDirection {
            case .one_one, .one_two, .one_three:
                placeholderLayputY = .top
            case .two_one, .two_two, .two_three:
                placeholderLayputY = .centerY
            case .three_one, .three_two, .three_three:
                placeholderLayputY = .bottom
            }
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .centerY,
                                           toItem: referenceView,
                                           toAttribute: placeholderLayputY)
            // 设置centerX
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .centerX,
                                           toItem: placeholderView,
                                           toAttribute: .centerX)
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .height,
                                           toItem: nil,
                                           toAttribute: .height)
            // 设置试图位置
            switch referenceDirection {
            case .one_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: placeholderView,
                                               toAttribute: .top,
                                               constant: offset)
            case .one_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: placeholderView,
                                               toAttribute: .top,
                                               constant: offset)
            case .one_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: placeholderView,
                                               toAttribute: .top,
                                               constant: offset)
            case .two_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: placeholderView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .two_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: placeholderView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .two_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: placeholderView,
                                               toAttribute: .centerY,
                                               constant: offset)
            case .three_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .bottom,
                                               toItem: placeholderView,
                                               toAttribute: .bottom,
                                               constant: offset)
            case .three_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerY,
                                               toItem: placeholderView,
                                               toAttribute: .bottom,
                                               constant: offset)
            case .three_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .top,
                                               toItem: placeholderView,
                                               toAttribute: .bottom,
                                               constant: offset)
            }
        default:
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .top,
                                           toItem: oneView,
                                           toAttribute: .bottom,
                                           constant: 0)
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .bottom,
                                           toItem: twoView,
                                           toAttribute: .top,
                                           constant: 0)
            // 设置中间试图的位置
            var placeholderLayputX = NSLayoutAttribute.left
            switch referenceDirection {
            case .one_one, .one_two, .one_three:
                placeholderLayputX = .left
            case .two_one, .two_two, .two_three:
                placeholderLayputX = .centerX
            case .three_one, .three_two, .three_three:
                placeholderLayputX = .right
            }
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .centerX,
                                           toItem: referenceView,
                                           toAttribute: placeholderLayputX)
            saveSuperView.yb_addConstraint(item: placeholderView,
                                           attribute: .width,
                                           toItem: nil,
                                           toAttribute: .width)
            // 设置centerY
            saveSuperView.yb_addConstraint(item: self,
                                           attribute: .centerY,
                                           toItem: placeholderView,
                                           toAttribute: .centerY)
            // 设置试图位置
            switch referenceDirection {
            case .one_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: placeholderView,
                                               toAttribute: .left,
                                               constant: offset)
            case .one_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: placeholderView,
                                               toAttribute: .left,
                                               constant: offset)
            case .one_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: placeholderView,
                                               toAttribute: .left,
                                               constant: offset)
            case .two_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: placeholderView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .two_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: placeholderView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .two_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: placeholderView,
                                               toAttribute: .centerX,
                                               constant: offset)
            case .three_one:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .left,
                                               toItem: placeholderView,
                                               toAttribute: .right,
                                               constant: offset)
            case .three_two:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .centerX,
                                               toItem: placeholderView,
                                               toAttribute: .right,
                                               constant: offset)
            case .three_three:
                saveSuperView.yb_addConstraint(item: self,
                                               attribute: .right,
                                               toItem: placeholderView,
                                               toAttribute: .right,
                                               constant: offset)
            }
        }
        // 设置大小
        yb_setSize(size: size)
    }
}

// MARK: - 部分约束布局
extension UIView {
    
    /// 相等布局（self: 参照的试图 不一定是父试图, 需要手动添加到父试图）所有试图都与 self 进行设置
    ///
    /// - Parameters:
    ///   - views: 需要布局的试图
    ///   - duration: 布局方向
    ///   - Parameter isSafeArea: 是否需要安全区域
    func yb_equal(views: [UIView], duration: YBLayoutEqual, isSafeArea: Bool = false) {
        // 判断试图是否添加到父试图
        let _ = self.yb_superView()
        // ================= 根据是否是安全区域获取数据 ==================
        let yb_layoutView = self.yb_layoutView(isSafeArea: isSafeArea)
        // ===========================================================
        for itemView in views {
            let _ = self.yb_superView()
            switch duration {
            case .width:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .width,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .width,
                                                     constant: 0)
            case .height:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .height,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .height,
                                                     constant: 0)
            case .size:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .width,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .width,
                                                     constant: 0)
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .height,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .height,
                                                     constant: 0)
            case .centerX:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .centerX,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .centerX,
                                                     constant: 0)
            case .centerY:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .centerY,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .centerY,
                                                     constant: 0)
            case .center:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .centerX,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .centerX,
                                                     constant: 0)
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .centerY,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .centerY,
                                                     constant: 0)
            case .top:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .top,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .top,
                                                     constant: 0)
            case .left:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .left,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .left,
                                                     constant: 0)
            case .right:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .right,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .right,
                                                     constant: 0)
            case .bottom:
                itemView.superview?.yb_addConstraint(item: itemView,
                                                     attribute: .bottom,
                                                     toItem: yb_layoutView,
                                                     toAttribute: .bottom,
                                                     constant: 0)
            }
        }
    }
    
    /// 相等大小布局（具体等于某个值）
    ///
    /// - Parameters:
    ///   - views: 需要布局的试图
    ///   - duration: 布局方向
    ///   - Parameter isSafeArea: 是否需要安全区域
    class func yb_equalSize(views: [UIView], size: yb_layoutSize, isSafeArea: Bool = false) {
        for itemView in views {
            itemView.yb_setSize(size: size, isSafeArea: isSafeArea)
        }
    }
    
    /// 设置试图大小(如果传的值小于0 就设置父试图大小)
    ///
    /// - Parameter size: 试图大小
    func yb_setSize(size: yb_layoutSize?, isSafeArea: Bool = false) {
        let yb_superView = self.yb_superView()
        if let width = size?.width {
            if width >= 0 {
                yb_superView.yb_addConstraint(item: self,
                                              attribute: .width,
                                              toItem: nil,
                                              toAttribute: .width,
                                              constant: width)
            } else {
                if #available(iOS 11.0, *) {
                    yb_superView.yb_addConstraint(item: self,
                                                  attribute: .width,
                                                  toItem: yb_superView.safeAreaLayoutGuide,
                                                  toAttribute: .width,
                                                  constant: width)
                } else {
                    yb_superView.yb_addConstraint(item: self,
                                                  attribute: .width,
                                                  toItem: yb_superView,
                                                  toAttribute: .width,
                                                  constant: width)
                }
            }
        }
        if let height = size?.height {
            if height >= 0 {
                yb_superView.yb_addConstraint(item: self,
                                              attribute: .height,
                                              toItem: nil,
                                              toAttribute: .height,
                                              constant: height)
            } else {
                if #available(iOS 11.0, *) {
                    yb_superView.yb_addConstraint(item: self,
                                                  attribute: .height,
                                                  toItem: yb_superView.safeAreaLayoutGuide,
                                                  toAttribute: .height,
                                                  constant: height)
                } else {
                    yb_superView.yb_addConstraint(item: self,
                                                  attribute: .height,
                                                  toItem: yb_superView,
                                                  toAttribute: .height,
                                                  constant: height)
                }
            }
        }
    }
}

// MARK: - 获取指定约束
extension UIView {
    
    /// 获取指定约束
    ///
    /// - Parameter type: 约束的类型
    /// - Returns: 返回获取的约束
    func yb_getLayout(type: NSLayoutAttribute) -> NSLayoutConstraint? {
        var yb_superView = superview
        while yb_superView != nil {
            for yb_layout in yb_superView!.constraints where yb_layout.firstItem === self {
                if yb_layout.firstAttribute == type {
                    return yb_layout
                }
            }
            yb_superView = yb_superView?.superview
        }
        return nil
    }
    
    /// 删除约束
    ///
    /// - Parameter type: 约束类型
    /// - Returns: 需要删除的约束（如果么有找到直接返回空）
    func yb_removeLayout(type: NSLayoutAttribute) -> NSLayoutConstraint? {
        var yb_superView = superview
        while yb_superView != nil {
            for yb_layout in yb_superView!.constraints where yb_layout.firstItem === self {
                if yb_layout.firstAttribute == type {
                    yb_superView?.removeConstraint(yb_layout)
                    return yb_layout
                }
            }
            yb_superView = yb_superView?.superview
        }
        return nil
    }
    
    /// 查找两个试图相同的父试图
    ///
    /// - Parameter other: 其他的试图
    /// - Returns: 返回找找到的父试图
    func yb_findSaveSuperView(other: UIView) -> UIView? {
        var yb_superView = Optional(self)
        while yb_superView != nil {
            var yb_otherSuperView = Optional(other)
            while yb_otherSuperView != nil {
                if (yb_otherSuperView === yb_superView) {
                    return yb_otherSuperView
                }
                yb_otherSuperView = yb_otherSuperView?.superview
            }
            yb_superView = yb_superView?.superview
        }
        return nil
    }
    
    /// 查找两个试图相同的父试图
    ///
    /// - Parameter other: 其他的试图
    /// - Returns: 返回找找到的父试图
    func yb_findSaveSuperView(others: [UIView]) -> UIView? {
        var yb_superView = self
        for other in others {
            let yb_saveView = yb_superView.yb_findSaveSuperView(other: other)
            if yb_saveView == nil {
                return nil
            }
            yb_superView = yb_saveView!
        }
        return yb_superView
    }
}

// MARK: - scrollView自定义congtSize大小
// 必须所有子试图全部添加上去
// 当有label这样的试图的时候必须是设置好的数据，这样才会自动设置大小
extension UIScrollView {
    
    /// 根据子试图自定义父试图高度
    ///
    /// - Parameters:
    ///   - bottomView: 最底部的试图
    ///   - bottomMargin: 最底部的边距
    func yb_setupAutoContentSize(bottomView: UIView, bottomMargin: CGFloat) {
        let _ = self.yb_superView()
        layoutIfNeeded()
        contentSize = CGSize(width: bounds.size.width, height: bottomView.frame.maxY + bottomMargin)
    }
    
    /// 根据子试图自定义父试图高度
    ///
    /// - Parameters:
    ///   - rightView: 最右边的试图
    ///   - rightMargin: 最右边的边距
    func yb_setupAutoContentSize(rightView: UIView, rightMargin: CGFloat) {
        let _ = self.yb_superView()
        layoutIfNeeded()
        contentSize = CGSize(width: rightView.frame.maxX + rightMargin, height: bounds.size.height)
    }
}

/// tableView cell高度自适应
/// 布局的时候需要从上到下依次布局、不能依据contentView的底部进行布局
/// 如果需要更新cell的高度，在更新前首先需要清除模型中的cell高度
class YBAotoCellModel: NSObject {
    var str = ""
    // MARK: - 属性
    /// 内部自定义的高度（用来缓存高度）
    private var _cellHeight: CGFloat = 0
    
    // MARK: - 方法 必须写到 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 最下面
    func yb_countCellHeight(cell: UITableViewCell, bottomView: UIView, bottomMargin: CGFloat) {
        // 如果有缓存数据直接返回缓存数据
        if _cellHeight > 0 {
            return
        }
        cell.contentView.layoutIfNeeded()
        _cellHeight = bottomView.frame.maxY + bottomMargin
    }
    
    /// 更新cell高度(reloadData之前需要先将模型中的数据清除)
    func yb_reloadCellHeight() {
        _cellHeight = 0
    }
    
    /// 获取cell高度
    func yb_cellHeight() -> CGFloat {
        return _cellHeight
    }
}


/// 设置图片背景试图（当前试图必须使用约束左上角布局, 并且设置大小约束）
/// 省去collectionView, collectionView性能低
class YBPhotosBgView: UIView {
    
    // MARK: - 属性
    fileprivate var imageClick: ((Int, [String]) -> ())?
    fileprivate var itemWidth: CGFloat = 0
    fileprivate var interval: CGFloat = 0
    fileprivate var pics = [String]()
    fileprivate var imageViews = [UIImageView]()
    
    fileprivate var heightLayout: NSLayoutConstraint?
    
    // MARK: - 构造方法
    init(itemWidth: CGFloat, interval: CGFloat, imageClick: @escaping (Int, [String]) -> ()) {
        super.init(frame: CGRect())
        self.imageClick = imageClick
        self.itemWidth = itemWidth
        self.interval = interval
        createImageViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createImageViews() {
        for i in 0..<3 {
            let y = i >= 1 ? (CGFloat(i) * itemWidth + CGFloat(i) * interval) : 0
            for j in 0..<3 {
                let x = j >= 1 ? (CGFloat(j) * itemWidth + CGFloat(j) * interval) : 0
                getImageView(tag: i * 3 + j, frame: CGRect(x: x, y: y, width: itemWidth, height: itemWidth))
            }
        }
        getImageView(tag: 0, frame: CGRect())
    }
    
    fileprivate func getImageView(tag: Int, frame: CGRect) {
        let imageView = UIImageView(contentMode: .scaleAspectFill)
        imageView.frame = frame
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageClick(tapGestureRecognizer:))))
        imageView.tag = tag
        imageView.clipsToBounds = true
        addSubview(imageView)
        imageViews.append(imageView)
    }
    
    /// 设置图片背景试图
    func setImages(pics: [String], oneSize: CGSize? = nil) {
        let _ = self.yb_superView()
        
        if heightLayout == nil {
            heightLayout = yb_getLayout(type: .height)
        }
        guard let height_layout = heightLayout else {
            assert(false, "必须之前强制实现大小约束， 避免性能")
            return
        }
        self.pics = pics
        // 设置图片
        setImages()
        guard pics.count > 0 else {
            height_layout.constant = 0
            return
        }
        // 根据高度设置父试图的高度
        var height: CGFloat = 0
        switch pics.count {
        case 1:
            var width = itemWidth
            if let oneSize = oneSize {
                height = oneSize.height
                width = oneSize.width
            } else {
                height = itemWidth
            }
            imageViews[9].frame = CGRect(x: 0, y: 0, width: width, height: height)
        case 2, 3:
            height = itemWidth
        case 4...6:
            height = itemWidth * 2 + interval * 1
        case 7...9:
            height = itemWidth * 3 + interval * 2
        default:
            break
        }
        height_layout.constant = height
        layoutIfNeeded()
    }
    
    // 设置图片
    fileprivate func setImages() {
        for imageView in imageViews {
            imageView.image = nil
            imageView.isHidden = true
        }
        if pics.count == 0 {
            return
        } else if pics.count == 1 {
            imageViews[9].isHidden = false
            imageViews[9].yb_kf(urlStr: pics.first!)
        } else if pics.count == 4 {
            imageViews[0].isHidden = false
            imageViews[1].isHidden = false
            imageViews[3].isHidden = false
            imageViews[4].isHidden = false
            imageViews[0].yb_kf(urlStr: pics[0])
            imageViews[1].yb_kf(urlStr: pics[1])
            imageViews[3].yb_kf(urlStr: pics[2])
            imageViews[4].yb_kf(urlStr: pics[3])
        } else {
            for index in 0..<pics.count {
                imageViews[index].isHidden = false
                imageViews[index].yb_kf(urlStr: pics[index])
            }
        }
    }
    
    /// 图片点击
    @objc fileprivate func imageClick(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let imageView = tapGestureRecognizer.view else {
            return
        }
        imageClick?(imageView.tag, pics)
    }
}

// MARK: - 自定义约束
extension UIView {
    
    /// 给试图添加约束
    ///
    /// - Parameters:
    ///   - item: 第一个约束对象
    ///   - attribute: 第一个约束类型
    ///   - toItem: 第二个约束对象
    ///   - toAttribute: 第二个约束类型
    ///   - constant: 约束值
    func yb_addConstraint(item: Any, attribute: NSLayoutAttribute, toItem: Any?, toAttribute: NSLayoutAttribute, constant: CGFloat = 0) {
        addConstraint(NSLayoutConstraint(item: item,
                                         attribute: attribute,
                                         relatedBy: .equal,
                                         toItem: toItem,
                                         attribute: toAttribute,
                                         multiplier: 1,
                                         constant: constant))
    }
}

// MARK: - 功能
extension UIView {
    
    /// 获取父试图（如果获取不到直接断言）
    ///
    /// - Returns: 返回父试图
    func yb_superView() -> UIView {
        guard let superView = superview else {
            assert(false, "获取不到父试图")
            return UIView()
        }
        return superView
    }
}
