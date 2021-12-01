//
//  ERExtension+CGRect.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import Foundation

public extension CGRect {
    
    /// OrginX || Left || MinX
    var ERMinX: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }
    
    /// OrginX + SizeW || Right || MaxX
    var ERMaxX: CGFloat {
        get {
            return self.ERMinX + ERW
        }
        set {
            ERMinX = newValue - ERW
        }
    }
    
    /// OrginX + SizeW/2 || CenterX
    var ERCenterX: CGFloat {
        get {
            return self.ERMinX + ERW/2
        }
        set {
            ERMinX = newValue - ERW/2
        }
    }
    
    /// OrginY || Top || MinY
    var ERMinY: CGFloat {
        get {
            return origin.y
        }
        set {
            origin.y = newValue
        }
    }
    
    /// OrginY - SizeH || Bottom || MaxY
    var ERMaxY: CGFloat {
        get {
            return self.ERMinY + ERH
        }
        set {
            ERMinY = newValue - ERH
        }
    }
    
    /// OrginY - SizeH/2 || Bottom || MaxY
    var ERCenterY: CGFloat {
        get {
            return self.ERMinY + ERH/2
        }
        set {
            ERMinY = newValue - ERH/2
        }
    }
    
    /// SizeW
    var ERW: CGFloat {
        get {
            return size.width
        }
        set {
            size.width = newValue
        }
    }
    
    /// SizeH
    var ERH: CGFloat {
        get {
            return size.height
        }
        set {
            size.height = newValue
        }
    }
    
    /// Center
    var ERCenter: CGSize {
        get {
            return CGSize(width: ERCenterX, height: ERCenterY)
        }
        set {
            ERCenterX = newValue.width
            ERCenterY = newValue.height
        }
    }
}

