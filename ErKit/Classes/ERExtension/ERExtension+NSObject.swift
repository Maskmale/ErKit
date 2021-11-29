//
//  ERExtension+NSObject.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import Foundation

extension NSObject {
        
    /// 获取 ClassName
    public var ClassName: String {
        get{
            let name =  type(of: self).description()
            if(name.contains(".")){
                return name.components(separatedBy: ".")[1]
            }else{
                return name
            }
        }
    }
    
}
