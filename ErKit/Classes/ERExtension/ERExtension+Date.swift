//
//  ERExtension+Date.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import Foundation

extension Date {
    /// 检查是否已过期
    var isExpired: Bool {
        let t1 = timeStamp // expirationTimeStamp
        let t2 = Date().timeStamp // 当前时间
        return t1 < t2
    }

    /// 检查是否未过期
    var isUnexpired: Bool {
        let t1 = timeStamp // expirationTimeStamp
        let t2 = Date().timeStamp // 当前时间
        return t1 > t2
    }

    /// 时间戳
    /// 当前时间到1970秒数
    var timeStamp: Int {
        let timeInterval: TimeInterval = timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
}

