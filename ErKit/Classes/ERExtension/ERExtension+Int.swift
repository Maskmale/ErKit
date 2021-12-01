//
//  ERExtension+Int.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
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
