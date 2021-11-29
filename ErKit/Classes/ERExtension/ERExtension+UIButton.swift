//
//  ERUIButtonExtension.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import UIKit

extension UIButton {
    
    public enum ERButttonTitlePosition {

        case top
        case bottom
        case left
        case right
    }
    
    func setERTitlePosition(_ position: ERButttonTitlePosition, spacing: CGFloat, RTL: Bool) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = self.titleLabel!.text!.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        var t_top: CGFloat
        var t_left: CGFloat
        var t_bottom: CGFloat
        var t_right: CGFloat
        
        var i_top: CGFloat
        var i_left: CGFloat
        var i_bottom: CGFloat
        var i_right: CGFloat
        
        switch (position){
        case .top:
            t_top = -(imageSize.height + titleSize.height + spacing)
            t_left = -imageSize.width
            t_bottom = 0
            t_right = 0
            
            i_top = 0
            i_left = 0
            i_bottom = 0
            i_right = -titleSize.width
            
            titleInsets = EZEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right, RTL: RTL)
            imageInsets = EZEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right, RTL: RTL)
        case .bottom:
            t_top = imageSize.height + titleSize.height - 10
            t_left = -imageSize.width
            t_bottom = 0
            t_right = 0
            
            i_top = -2*spacing
            i_left = 0
            i_bottom = 0
            i_right = -titleSize.width
            
            titleInsets = EZEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right, RTL: RTL)
            imageInsets = EZEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right, RTL: RTL)
        case .left:
            t_top = 0
            t_left = -(imageSize.width * 2)
            t_bottom = 0
            t_right = 0
            
            i_top = 0
            i_left = 0
            i_bottom = 0
            i_right = -(titleSize.width * 2 + spacing)
            
            titleInsets = EZEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right, RTL: RTL)
            imageInsets = EZEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right, RTL: RTL)
            
        case .right:
            t_top = 0
            t_left = 0
            t_bottom = 0
            t_right = -spacing
            
            i_top = 0
            i_left = 0
            i_bottom = 0
            i_right = 0
            
            titleInsets = EZEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right, RTL: RTL)
            imageInsets = EZEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right, RTL: RTL)
        default:
            t_top = 0
            t_left = 0
            t_bottom = 0
            t_right = 0
            
            i_top = 0
            i_left = 0
            i_bottom = 0
            i_right = 0
            
            titleInsets = EZEdgeInsets(top: t_top, left: t_left, bottom: t_bottom, right: t_right, RTL: RTL)
            imageInsets = EZEdgeInsets(top: i_top, left: i_left, bottom: i_bottom, right: i_right, RTL: RTL)
        }
         
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
    private func EZEdgeInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat, RTL: Bool) -> UIEdgeInsets {
        if RTL {
            return UIEdgeInsets(top: top, left: right, bottom: bottom, right: left)
        }else {
            return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        }
    }
}
