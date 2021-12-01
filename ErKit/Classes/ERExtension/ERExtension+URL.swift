//
//  ERExtension+URL.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import Foundation

//MARK: - URL Extension
extension URL {
    
    /// 处理 urlStr 中的百分号
    /// - Parameter string: urlStr
    /// - Returns: URL
    static func initPercent(string:String) -> URL {
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        let url = URL.init(string: urlwithPercentEscapes!)
        return url!
    }
    
    
    /// 查询 URL 对应的文件是否为隐藏
    var isHidden: Bool {
        get {
            return (try? resourceValues(forKeys: [.isHiddenKey]))?.isHidden == true
        }
        set {
            var resourceValues = URLResourceValues()
            resourceValues.isHidden = newValue
            do {
                try setResourceValues(resourceValues)
            } catch {
                ERLog("isHidden error:\(error)")
            }
        }
    }
}
