//
//  EZLog.swift
//  EZKit
//
//  Created by Erbash on 2021/11/29.
//

import Foundation

public func EZLog<T>(_ message:T, file:String = #file, funcName:String = #function, lineNum:Int = #line) {
     let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS "
        return formatter
    }()

    #if DEBUG
    let file = (file as NSString).lastPathComponent;
    print("EZLog:\(dateFormatter.string(from: Date())) file:\(file) lineNum:\(lineNum) message:\(message)");
    #endif
}
