//
//  ERUIViewExtension.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import UIKit

//MARK: - FrameExtenstion
public extension UIView {
    
    /// OrginX || Left || MinX
    var ERMinX: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
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
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
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
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// SizeH
    var ERH: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    /// Size
    var ERSize: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
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
    
    /// Bounds
    var ERBounds: CGRect {
        get {
            return self.bounds
        }
        set {
            self.bounds = newValue
        }
    }
    
    var EROrigin:CGPoint{
        get{
            return self.frame.origin
        }set{
            self.frame.origin = newValue
        }
    }
}

//MARK: - ????????????
extension UIView {
    // ?????????????????????(????????????)
    @IBInspectable public var ERZPosition: CGFloat {
        get {
            return self.layer.zPosition
        }
        set {
            self.layer.zPosition = newValue
        }
    }
}


//MARK: - LayerStyleExtenstion
extension UIView {
    
    /**
     @IBInspectable ????????? SB ??? XIB
     */
    
    ///??????????????????
    @IBInspectable public var ERCornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    ///????????????????????????
    @IBInspectable public var ERBorderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    ///??????????????????
    @IBInspectable public var ERBorderColor: UIColor? {
        get {
            return self.layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }


    ///??????????????????
    @IBInspectable public var ERShadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    ///???????????????
    @IBInspectable public var ERShadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    ///?????????????????????
    @IBInspectable public var ERShadowColor: UIColor? {
        get {
            return self.layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    ///??????????????????
    @IBInspectable public var ERShadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
}

//MARK: - LayerStyleExtenstion
extension UIView {
    /// ????????????
    /// - Parameter cRadius: ????????????
    public func setERLayer(cRadius:CGFloat) {
        self.ERCornerRadius = cRadius
    }
    
    /// ????????????
    /// - Parameters:
    ///   - bWidth: ????????????
    ///   - bColor: ????????????
    public func setERLayer(bWidth:CGFloat,
                           bColor:UIColor) {
        self.ERBorderWidth = bWidth
        self.ERBorderColor = bColor
    }
    
    /// ????????????
    /// - Parameters:
    ///   - sColor: ????????????
    ///   - sOffsetX: ???????????????X
    ///   - sOffsetY: ???????????????Y
    ///   - sOpacity: ???????????????
    ///   - sRadius: ????????????
    public func setERLayer(sColor:UIColor,
                           sOffsetX:CGFloat,
                           sOffsetY:CGFloat,
                           sOpacity:Float,
                           sRadius:CGFloat) {
        
        self.ERShadowColor = sColor
        self.ERShadowOpacity = sOpacity
        self.ERShadowRadius = sRadius
        self.ERShadowOffset = CGSize(width: sOffsetX, height: sOffsetY)
    }
    
    /// ????????????????????????
    /// - Parameters:
    ///   - cRadius: ????????????
    ///   - bWidth: ????????????
    ///   - bColor: ????????????
    public func setERLayer(cRadius:CGFloat,
                           bWidth:CGFloat,
                           bColor:UIColor) {
        setERLayer(cRadius: cRadius)
        setERLayer(bWidth: bWidth, bColor: bColor)
    }
    
    /// ?????????????????????
    /// - Parameters:
    ///   - sColor: ????????????
    ///   - sOffsetX: ???????????????X
    ///   - sOffsetY: ???????????????Y
    ///   - sOpacity: ???????????????
    ///   - sRadius: ????????????
    public func setERLayer(cRadius:CGFloat,
                           sColor:UIColor,
                           sOffsetX:CGFloat,
                           sOffsetY:CGFloat,
                           sOpacity:Float,
                           sRadius:CGFloat
                           ) {
        setERLayer(cRadius: cRadius)
        setERLayer(sColor: sColor, sOffsetX: sOffsetX, sOffsetY: sOffsetY, sOpacity: sOpacity, sRadius: sRadius)
    }
    
    /// ?????????????????????
    /// - Parameters:
    ///   - bWidth: ????????????
    ///   - bColor: ????????????
    ///   - sColor: ????????????
    ///   - sOffsetX: ???????????????X
    ///   - sOffsetY: ???????????????Y
    ///   - sOpacity: ???????????????
    ///   - sRadius: ????????????
    public func setERLayer(bWidth:CGFloat,
                           bColor:UIColor,
                           sColor:UIColor,
                           sOffsetX:CGFloat,
                           sOffsetY:CGFloat,
                           sOpacity:Float,
                           sRadius:CGFloat) {
        
        setERLayer(bWidth: bWidth, bColor: bColor)
        setERLayer(sColor: sColor, sOffsetX: sOffsetX, sOffsetY: sOffsetY, sOpacity: sOpacity, sRadius: sRadius)
    }
    
    /// ?????????????????????
    /// - Parameters:
    ///   - cRadius: ????????????
    ///   - bWidth: ????????????
    ///   - bColor: ????????????
    ///   - sColor: ????????????
    ///   - sOffsetX: ???????????????X
    ///   - sOffsetY: ???????????????Y
    ///   - sOpacity: ???????????????
    ///   - sRadius: ????????????
    public func setERLayer(cRadius:CGFloat,
                           bWidth:CGFloat,
                           bColor:UIColor,
                           sColor:UIColor,
                           sOffsetX:CGFloat,
                           sOffsetY:CGFloat,
                           sOpacity:Float,
                           sRadius:CGFloat) {
        
        setERLayer(cRadius: cRadius, bWidth: bWidth, bColor: bColor)
        setERLayer(sColor: sColor, sOffsetX: sOffsetX, sOffsetY: sOffsetY, sOpacity: sOpacity, sRadius: sRadius)
    }
    
}


//MARK: - ?????????
extension UIView {
    /// ???????????????
    /// - Parameter colors: ???????????????
    public func setERLayerColors(_ colors:[UIColor])  {
        var cgColors = [CGColor]()
        for c in colors {
            cgColors.append(c.cgColor)
        }
        let layer = CAGradientLayer()
        layer.frame = self.frame
        layer.colors = cgColors
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 0, y: 0.5)
        self.layer.addSublayer(layer)
    }
}

//MARK: - ?????????
extension UIView {

    /// ?????????????????????
    /// - Parameter subviews: ???????????????
    public func ERAddSubviews(_ subviews: [UIView]) {
        subviews.forEach({ self.addSubview($0) })
    }
    
    /// ?????????????????????
    public func ERRemoveSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
}

extension UIView {
    /// ???????????????
    public func ERFirstResponder() -> UIView? {
        var views = [UIView](arrayLiteral: self)
        var i = 0
        repeat {
            let view = views[i]
            if view.isFirstResponder {
                return view
            }
            views.append(contentsOf: view.subviews)
            i += 1
        } while i < views.count
        return nil
    }
}

extension UIView {
    /// ??????????????????
    public var ERParentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

//MARK: - ??????
extension UIView {
    /// ?????? View
    /// - Returns: ????????????
    func ERScreenshot() -> UIImage? {
        let scale:CGFloat = UIScreen.main.scale// ?????????????????????????????????????????????
        UIGraphicsBeginImageContextWithOptions(self.ERSize, true, scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image
    }
}
