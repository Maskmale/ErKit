//
//  ERExtension+Array.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import Foundation

extension Array {
    public func iSafeObject(at index: Int) -> Element? {
        if (0..<count).contains(index) {
            return self[index]
        } else {
            return nil
        }
    }
}
