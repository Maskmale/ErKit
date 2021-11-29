//
//  ERUIViewExtension.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
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


//MARK: - LayerExtenstion
extension UIView {
    
    /**
     @IBInspectable 用于在 SB 和 XIB
     */
    
    ///设置边框圆角
    @IBInspectable public var ERCornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    ///设置视图边框宽度
    @IBInspectable public var ERBorderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    ///设置边框颜色
    @IBInspectable public var ERBorderColor: UIColor? {
        get {
            return self.layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }


    ///设置阴影半径
    @IBInspectable public var ERShadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    ///设置透明度
    @IBInspectable public var ERShadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    ///设置阴影偏移量
    @IBInspectable public var ERShadowColor: UIColor? {
        get {
            return self.layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    ///设置阴影颜色
    @IBInspectable public var ERShadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    // 图层的显示顺序(层级关系)
    @IBInspectable public var ERZPosition: CGFloat {
        get {
            return self.layer.zPosition
        }
        set {
            self.layer.zPosition = newValue
        }
    }
        
    /// 设置圆角
    /// - Parameter cRadius: 圆角半径
    public func setERLayer(cRadius:CGFloat) {
        self.ERCornerRadius = cRadius
    }
    
    /// 设置边框
    /// - Parameters:
    ///   - bWidth: 边框宽度
    ///   - bColor: 边框颜色
    public func setERLayer(bWidth:CGFloat,
                           bColor:UIColor) {
        self.ERBorderWidth = bWidth
        self.ERBorderColor = bColor
    }
    
    /// 设置阴影
    /// - Parameters:
    ///   - sColor: 阴影颜色
    ///   - sOffsetX: 阴影偏移量X
    ///   - sOffsetY: 阴影偏移量Y
    ///   - sOpacity: 阴影透明度
    ///   - sRadius: 阴影半径
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
    
    /// 设置边框以及圆角
    /// - Parameters:
    ///   - cRadius: 圆角半径
    ///   - bWidth: 边框宽度
    ///   - bColor: 边框颜色
    public func setERLayer(cRadius:CGFloat,
                           bWidth:CGFloat,
                           bColor:UIColor) {
        setERLayer(cRadius: cRadius)
        setERLayer(bWidth: bWidth, bColor: bColor)
    }
    
    /// 设置阴影及圆角
    /// - Parameters:
    ///   - sColor: 阴影颜色
    ///   - sOffsetX: 阴影偏移量X
    ///   - sOffsetY: 阴影偏移量Y
    ///   - sOpacity: 阴影透明度
    ///   - sRadius: 阴影半径
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
    
    /// 设置阴影及边框
    /// - Parameters:
    ///   - bWidth: 边框宽度
    ///   - bColor: 边框颜色
    ///   - sColor: 阴影颜色
    ///   - sOffsetX: 阴影偏移量X
    ///   - sOffsetY: 阴影偏移量Y
    ///   - sOpacity: 阴影透明度
    ///   - sRadius: 阴影半径
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
    
    /// 设置阴影及圆角
    /// - Parameters:
    ///   - cRadius: 圆角半径
    ///   - bWidth: 边框宽度
    ///   - bColor: 边框颜色
    ///   - sColor: 阴影颜色
    ///   - sOffsetX: 阴影偏移量X
    ///   - sOffsetY: 阴影偏移量Y
    ///   - sOpacity: 阴影透明度
    ///   - sRadius: 阴影半径
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


//MARK: - Other
extension UIView {
    /// 设置渐变色
    /// - Parameter colors: 渐变色数组
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

    /// 添加多个子视图
    /// - Parameter subviews: 子视图数组
    public func ERAddSubviews(_ subviews: [UIView]) {
        subviews.forEach({ self.addSubview($0) })
    }
    
    /// 删除所有子视图
    public func ERRemoveSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
    /// 第一响应者
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
    
    /// 获取父控制器
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
    
    /// 截图 View
    /// - Returns: 视图截图
    func ERScreenshot() -> UIImage? {
        let scale:CGFloat = UIScreen.main.scale// 设置屏幕倍率可以保证截图的质量
        UIGraphicsBeginImageContextWithOptions(self.ERSize, true, scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image
    }
}
