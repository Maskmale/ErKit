//
//  ERUIButtonExtension.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//
//  https://juejin.cn/post/6844903566616854541

import UIKit

extension UIButton {
    /// 标题位置样式
    ///
    /// leading 与 left 的区别 (同 trailing 与 right 的区别)
    ///
    /// leading 的含义是头部, left 的含义是左. 对所有人来说, left 都是 left. 对中国人来说, 一行文字的 leading 是 left, 但是对一些其他文化的人 (比如穆斯林) 来说, 一行文字的 leading 则是 right
    ///
    /// 如需动态布局请在 APP Delegate 中设置 UIView.appearance().semanticContentAttribute 的值，不设置或者设置.forceLeftToRight,.forceRightToLeft以外的值将以 .forceLeftToRight 为默认值计算
    
    public enum ERTitlePosition {
        /// 标题在上，图片在下，标题和图标垂直居中对齐。
        case top            // Align center vertically
        
        /// 无论布局方向 LTR 还是 RTL 标题始终在左，图片始终在右，整体居中。
        case left           //Align center horizontally
        
        /// 布局方向 LTR 时标题在左，图片在右，标题和图标水平居中对齐。
        /// 布局方向 RTL 时标题在右，图片在左，标题和图标水平居中对齐。
        case leading        //Align center horizontally
        
        /// 标题在下，图片在上，标题和图标垂直居中对齐。
        case bottom         // Align center vertically
        
        /// 无论布局方向 LTR 还是 RTL 标题始终在左，标题在始终右，图片始终在左，标题和图标水平居中对齐。
        case right          //Align center horizontally
        
        /// 布局方向 LTR 时标题在右，图片在左，标题和图标水平居中对齐。
        /// 布局方向 RTL 时标题在左，图片在右，标题和图标水平居中对齐。
        case trailing       //Align center horizontally
    }
    
    
    /// 设置按钮标题和图标位置
    /// - Parameters:
    ///   - position: 标题和图标位置样式
    ///   - spacing: 标题和图标间距
    ///
    /// 使用方式
    ///
    ///     let v = UIButton()
    ///     // 设置 frame，如使用 sanapkit 等自动布局框架，设置约束后需要调用 layoutIfNeeded() 方法后再调用此函数
    ///     v.setERTitlePosition(.top, spacing: 10)
    public func setERTitlePosition(_ position: ERTitlePosition, spacing: CGFloat = 20) {
        
        let layoutDirection = UIView.appearance().semanticContentAttribute
        
        switch layoutDirection {
        case .forceLeftToRight,.forceRightToLeft :
            break
        default:
            ERLog("如需动态布局请在 APP Delegate 中设置 UIView.appearance().semanticContentAttribute 的值，不设置或者设置.forceLeftToRight,.forceRightToLeft以外的值将以 .forceLeftToRight 为默认值计算", logEmoji: .rotatingLight)
        }
       
        let isRTL = layoutDirection == .forceRightToLeft
        
        let imageRect = imageView!.frame
        let titleRect = titleLabel!.frame

        
        let contentH = imageRect.ERH + titleRect.ERH + spacing
        
        var t_top: CGFloat = 0
        var t_left: CGFloat = 0
        var t_bottom: CGFloat = 0
        var t_right: CGFloat = 0
        
        var i_top: CGFloat = 0
        var i_left: CGFloat = 0
        var i_bottom: CGFloat = 0
        var i_right: CGFloat = 0
        
        switch position {
        case .top:
            let marginFromSuperview = (self.ERH - contentH)/2
            
            t_top = marginFromSuperview
            t_bottom = marginFromSuperview + contentH - titleRect.ERH
            
            i_top = marginFromSuperview + contentH - imageRect.ERH
            i_bottom = self.ERH - (i_top + imageRect.ERH)
            
            if isRTL {
                t_left = imageRect.ERW/2
                t_right = -t_left

                i_left = -titleRect.ERW/2
                i_right = -i_left
            }else {
                t_left = (self.ERW/2 - titleRect.ERMinX - titleRect.ERW/2)
                t_right = -t_left

                i_left = (self.ERW/2 - imageRect.ERMinX - imageRect.ERW/2)
                i_right = -i_left
            }
        
        case .left:
            t_top = 0
            t_bottom = 0
            
            i_top = 0
            i_bottom = 0
            
            if isRTL {
                t_left = -spacing/2
                t_right = -t_left
                
                i_left = spacing/2
                i_right = -i_left
            }else {
                t_left = -(imageRect.ERW + spacing/2)
                t_right = -t_left

                i_left = titleRect.ERW + spacing/2
                i_right = -i_left
            }
            
        case .leading:
            t_top = 0
            t_bottom = 0
            
            i_top = 0
            i_bottom = 0
            
            if isRTL {
                t_left = imageRect.ERW + spacing/2
                t_right = -t_left

                i_left = -(titleRect.ERW + spacing/2)
                i_right = -i_left
            }else {
                t_left = -(imageRect.ERW + spacing/2)
                t_right = -t_left

                i_left = titleRect.ERW + spacing/2
                i_right = -i_left
            }
            
        case .bottom:
            let marginFromSuperview = (self.ERH - contentH)/2
            
            t_top = marginFromSuperview + contentH - titleRect.ERH
            t_bottom = marginFromSuperview
            
            i_top = marginFromSuperview
            i_bottom = self.ERH - (i_top + imageRect.ERH)
            
            if isRTL {
                t_left = -(self.ERW/2 - titleRect.ERMinX - titleRect.ERW/2)
                t_right = -t_left
                
                i_left = -(self.ERW/2 - imageRect.ERMinX - imageRect.ERW/2)
                i_right = -i_left
            }else {
                t_left = (self.ERW/2 - titleRect.ERMinX - titleRect.ERW/2)
                t_right = -t_left
                
                i_left = (self.ERW/2 - imageRect.ERMinX - imageRect.ERW/2)
                i_right = -i_left
            }
            
        case .right:
            t_top = 0
            t_bottom = 0
            
            i_top = 0
            i_bottom = 0
            
            if isRTL {
                t_left = imageRect.ERW + spacing/2
                t_right = -t_left

                i_left = -(titleRect.ERW + spacing/2)
                i_right = -i_left
            }else {
                t_left = spacing/2
                t_right = -t_left
                
                i_left = -spacing/2
                i_right = -i_left
            }
            
        case .trailing:
            t_top = 0
            t_bottom = 0
            
            i_top = 0
            i_bottom = 0
            
            if isRTL {
                t_left = -spacing/2
                t_right = -t_left
                
                i_left = spacing/2
                i_right = -i_left
            }else {
                t_left = spacing/2
                t_right = -t_left
                
                i_left = -spacing/2
                i_right = -i_left
            }
        }
         
        self.titleEdgeInsets = UIEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right)
        self.imageEdgeInsets = UIEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right)
    }
}
