//
//  ERExtension+Date.swift
//  OzKeyboard
//
//  Created by Erbash on 2021/1/25.
//

import Foundation

extension Date {
    
    /// 检查内购项是否已过期
    var isExpired: Bool {
        let t1 = self.timeStamp
        let t2 = Date().timeStamp
        EZLog("\nisExpired?\nt1:\(t1)\nt2:\(t2)")
        return t1 < t2
    }
    
    
    /// 时间戳
    /// 当前时间到1970秒数
    var timeStamp: Int {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
}

