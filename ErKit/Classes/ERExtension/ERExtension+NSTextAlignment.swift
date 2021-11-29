//
//  ERNSTextAlignmentExtension.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import UIKit

//MARK: - NSTextAlignment Extension
extension NSTextAlignment {
    
    static var ERDynamicRTL: NSTextAlignment {
        if UIView.appearance().semanticContentAttribute == .forceLeftToRight {
            return .right
            
        }else if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            return .left
            
        }else {
            return .natural
        }
    }
    
    static var ERDynamicLTR: NSTextAlignment {
        if UIView.appearance().semanticContentAttribute == .forceLeftToRight {
            return .left
            
        }else if UIView.appearance().semanticContentAttribute == .forceRightToLeft {
            return .right
            
        }else {
            return .natural
        }
    }
    
//    static var invNatural: NSTextAlignment {
//        print("Waring:NSTextAlignment.invNatural 可能不可用！")
//        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .left : .right
//    }
    
}
