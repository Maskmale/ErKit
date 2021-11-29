//
//  ERExtension+UIEdgeInsets.swift
//  OzKeyboard
//
//  Created by Erbash on 2021/1/22.
//

import UIKit

extension UIEdgeInsets {
    /// Creates a new instance with all insets set to `inset`.
    init(inset: CGFloat) {
        self.init(horizontalInset: inset, verticalInset: inset)
    }
    
    /// Creates a new instance with `left` and `right` set to `horizontalInset` and `top` and `bottom` set to `verticalInset`.
    init(horizontalInset: CGFloat, verticalInset: CGFloat) {
        self.init(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
    
    init(ERDynamicInset top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            self.init(top: top, left: trailing, bottom: bottom, right: leading)
        }else {
            self.init(top: top, left: leading, bottom: bottom, right: trailing)
        }
    }
}
