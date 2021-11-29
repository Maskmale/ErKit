//
//  ERExtension+Int.swift
//  OzKeyboard
//
//  Created by Erbash on 2021/1/26.
//

import Foundation

extension Int {
    /// 时间戳转 Date
    var date: Date {
        let timeInterval:TimeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        return date
    }
}
