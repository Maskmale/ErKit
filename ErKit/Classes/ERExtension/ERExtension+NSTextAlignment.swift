//
//  ERNSTextAlignmentExtension.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//
// leading 与 left 的区别 (同 trailing 与 right 的区别)
// leading 的含义是头部, left 的含义是左. 对所有人来说, left 都是 left. 对中国人来说, 一行文字的 leading 是 left, 但是对一些其他文化的人 (比如穆斯林) 来说, 一行文字的 leading 则是 right

import UIKit

public extension NSTextAlignment {
    
    /// leading 对齐方式
    ///
    /// 布局方向 LTR 时左对齐
    ///
    /// 布局方向 RTL 时右对齐
    static var leading: NSTextAlignment {
        if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            return .right
        }else {
            return .left
        }
    }

    /// trailing 对齐方式
    ///
    /// 布局方向 LTR 时右对齐
    ///
    /// 布局方向 RTL 时左对齐
    static var trailing: NSTextAlignment {
        if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            return .left
        }else {
            return .right
        }
    }
}
