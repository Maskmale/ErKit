//
//  ERExtension+UITableViewCell.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /// 为 UITableViewSection 设置圆角
    /// - Parameters:
    ///   - cornerRadius: sectionRadius
    ///   - tableView: tableView
    ///   - indexPath: indexPath
    func setERSectionCornerRadius(_ cornerRadius: CGFloat,forTableView tableView: UITableView, atIndexPath indexPath:IndexPath) {
        var corners: UIRectCorner = []
        var y:CGFloat = 0
        var height = self.ERH
        
        if indexPath.row == 0 {
            y = 1
//            tableView.separatorStyle = .none
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            height -= 1.5
//            tableView.separatorStyle = .none
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }

        let maskLayer = CAShapeLayer()
        let margin:CGFloat = 20
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: margin,
                                                          y: y,
                                                          width: self.ERW-2*margin,
                                                          height: height),
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius,
                                                          height: cornerRadius)).cgPath
        self.layer.mask = maskLayer
    }
    
    /** adds a drop shadow to the background view of the (grouped) cell */
    // 在(分组的)单元格的背景视图中添加投影
    func addShadowToCellInTableView(tableView: UITableView, atIndexPath indexPath:IndexPath) -> () {
        let isFirstRow: Bool = (indexPath.row == 0)
        let isLastRow: Bool = (indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-1)
        
        // the shadow rect determines the area in which the shadow gets drawn
        // 阴影矩形(shadow rect)确定阴影绘制的区域
        var shadowRect = CGRect(origin: self.EROrigin, size: CGSize(width: 0, height: -10))
        
        if isFirstRow {
            shadowRect.origin.y -= 10
        }else if isLastRow {
            shadowRect.size.height -= 10
        }
        
        // the mask rect ensures that the shadow doesn't bleed into other table cells
        // 蒙版矩形可以确保阴影不会渗透到其他表格单元格中
        var maskRect = CGRect(origin: self.EROrigin, size: CGSize(width: -20, height: -0))
        
        if isFirstRow {
            maskRect.origin.y -= 10
            maskRect.size.height += 10
        }else if isLastRow {
            maskRect.size.height += 10
        }
        
        // configure the background view layer with the shadow
        // 配置背景视图层与阴影
        let layer = self.layer
        layer.shadowPath = UIBezierPath.init(roundedRect: shadowRect, cornerRadius: 10).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.opacity = 0.25
        layer.masksToBounds = true
        
        // and finally add the shadow mask
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath.init(rect: maskRect).cgPath
        layer.mask = maskLayer
        
    }
}
