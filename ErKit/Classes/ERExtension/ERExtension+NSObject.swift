//
//  ERExtension+NSObject.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
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
