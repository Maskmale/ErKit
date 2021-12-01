//
//  ERExtension+UIEdgeInsets.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    /// 为每条边设置向内方向的偏移量，设置正值向内偏移，设置负值向外偏移
    init(all: CGFloat) {
        self.init(horizontal: all, vertical: all)
    }
    
    /// 为水平（horizontal）方向的边 `left` & `right` 和垂直（vertical）方向的边 `top` & `bottom` 分别设置偏移量，设置正值向内偏移，设置负值向外偏移
    /// - Parameters:
    ///   - horizontal: `left` & `right`
    ///   - vertical: `top` & `bottom`
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    /// 为每条边设置向内方向的偏移量，设置正值向内偏移，设置负值向外偏移。`leading` & `trailing` 根据 view.semanticContentAttribute 互换值
    /// leading 与 left 的区别 (同 trailing 与 right 的区别)
    /// leading 的含义是头部, left 的含义是左. 对所有人来说, left 都是 left. 对中国人来说, 一行文字的 leading 是 left, 但是对一些其他文化的人 (比如穆斯林) 来说, 一行文字的 leading 则是 right
    /// - Parameters:
    ///   - top: top
    ///   - leading: LTR -> left || RTL -> right
    ///   - bottom: bottom
    ///   - trailing:  LTR -> right || RTL -> left
    init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            self.init(top: top, left: trailing, bottom: bottom, right: leading)
        }else {
        }
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}
