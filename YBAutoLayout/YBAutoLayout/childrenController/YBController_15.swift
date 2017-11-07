//
//  YBController_15.swift
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/10/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

import UIKit

class YBController_15: UITableViewController {
    
    var dataArr = [YBTableCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "ASDASDASDASDASD"
        let images = ["https://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/dc54564e9258d10953d05e0cd258ccbf6c814d59.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147461&di=efbb20f8c58e11c7951fa701d472983a&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd788d43f8794a4c22fe6ab9408f41bd5ac6e3943.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147461&di=1f64e9e1e9fc465ba4386aed07a0f95a&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F1f178a82b9014a90e7eb9d17ac773912b21bee47.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510037438956&di=dacd4ef11ccea8647597fcdfc6e9c9a0&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9a504fc2d5628535afc0d3eb99ef76c6a6ef63d3.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147460&di=fcead8b4b662a24e7d655ff2f49d4224&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0d338744ebf81a4cebca559dd12a6059242da6ee.jpg",
                      "https://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/dc54564e9258d10953d05e0cd258ccbf6c814d59.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147461&di=efbb20f8c58e11c7951fa701d472983a&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd788d43f8794a4c22fe6ab9408f41bd5ac6e3943.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147461&di=1f64e9e1e9fc465ba4386aed07a0f95a&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F1f178a82b9014a90e7eb9d17ac773912b21bee47.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507612147461&di=5d9054269ba26e2a42b5e624493c5abf&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F120913%2F1-120913151Z6.jpg"]
        
        for _ in 0..<100 {
            var modelTitle = str
            let num = Int.yb_random(between: 0, and: 8)
            for _ in 0..<num {
                modelTitle += str
            }
            let modelImages = images[0..<num].filter({ (_) -> Bool in
                return true
            })
            dataArr.append(YBTableCellModel(title: modelTitle, images: modelImages))
        }
        
        // 准备UI
        prepareUI()
    }
}

// MARK: - 准备UI
extension YBController_15 {
    
    /// 准备UI
    fileprivate func prepareUI() {
        // 去掉分割线
        tableView.separatorStyle = .none
        
        tableView.yb_register(cellWithClass: YBAutoHeightCell.self)
        tableView.estimatedRowHeight = 300
    }
}

extension YBController_15 {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.yb_dequeueReusableCell(withClass: YBAutoHeightCell.self, for: indexPath)
        cell.model = dataArr[indexPath.row]
        cell.yb_delegate = self
        cell.model.yb_countCellHeight(cell: cell, bottomView: cell.addBtn, bottomMargin: 10)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataArr[indexPath.row].yb_cellHeight()
    }
}

extension YBController_15: YBAutoHeightCellDelegate {
    
    func reloadCell() {
        tableView.reloadData()
    }
}

protocol YBAutoHeightCellDelegate: NSObjectProtocol {
    
    func reloadCell()
}

class YBAutoHeightCell: UITableViewCell {
    
    var model: YBTableCellModel! {
        didSet {
            titleLabel.text = model.title
            imagesBgView.setImages(pics: model.images, oneSize: CGSize(width: 200, height: 300))
        }
    }
    
    var yb_delegate: YBAutoHeightCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 准备UI
    fileprivate func prepareUI() {
        // 去除选中效果
        selectionStyle = .none
        
        contentView.yb_alignment(view: titleLabel, duration: .inTop, interval: 8, sideInterval: 8)
        contentView.addSubview(imagesBgView)
        titleLabel.yb_out(view: imagesBgView,
                          duration: .bottomLeft,
                          size: yb_layoutSize(width: 350, height: 0),
                          offset: yb_layoutOffset(horizontal: 0, vertical: 8))
        
        contentView.addSubview(addBtn)
        imagesBgView.yb_out(view: addBtn,
                            duration: .bottomLeft,
                            size: yb_layoutSize(width: 100, height: 44),
                            offset: yb_layoutOffset(horizontal: 0, vertical: 10))
        
        // 设置分割线
        _ = yb_separator(lineWidth: 1, lineColor: UIColor.lightGray, leftInterval: 8, rightInterval: 8)
    }
    
    /// 标题 懒加载
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        return label
    }()
    
    /// 图片背景试图 懒加载
    lazy var imagesBgView: YBPhotosBgView = {
        let itemWidth = UIScreen.main.bounds.size.width * 0.26
        let view = YBPhotosBgView(itemWidth: itemWidth, interval: 8, imageClick: { (index, strings) in
            print("点击了 -> \(index)")
        })
        return view
    }()
    
    /// 添加按钮 懒加载
    lazy var addBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("添加", for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func addBtnClick() {
        model.title += "123123123123123123"
        model.yb_reloadCellHeight()
        // 更新试图
        yb_delegate?.reloadCell()
    }
}

class YBTableCellModel: YBAotoCellModel {
    
    var title = ""
    var images = [String]()
    
    init(title: String, images: [String]) {
        super.init()
        self.title = title
        self.images = images
    }
}
