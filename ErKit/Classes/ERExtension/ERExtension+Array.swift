//
//  ERExtension+Array.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
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
