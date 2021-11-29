//
//  ERExtension+UIImage.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import UIKit

//MARK: - UIImage Extension
extension UIImage {
    
    
    /// 获取纯色图片
    /// - Parameters:
    ///   - color: 图片颜色
    ///   - size: 尺寸
    /// - Returns: 纯色图片
    /// let colorImage = UIImage().getERImage(UIColor.white)
    public class func getERImage(_ color:UIColor, size:CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        var resultImage:UIImage? = nil
        let rect = CGRect(x:0, y:0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return resultImage
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
        
        /**
         let rect: CGRect = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
         UIGraphicsBeginImageContext(rect.size)
         let context: CGContext = UIGraphicsGetCurrentContext()!
         context.setFillColor(color.cgColor)
         context.fill(rect)
         
         guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
         UIGraphicsGetCurrentContext()
         return image
         */
    }
    
    
    public enum EZWritingDirection : Int {
        case natural = -1 // Determines direction using the Unicode Bidi Algorithm rules P2 and P3

        case leftToRight = 0 // Left to right writing direction

        case rightToLeft = 1 // Right to left writing direction
    }
    
    public class func getERScreenshot(view:UIView) -> UIImage? {

        let scale:CGFloat = UIScreen.main.scale// 设置屏幕倍率可以保证截图的质量
        UIGraphicsBeginImageContextWithOptions(view.ERSize, true, scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image

        
//        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//        let image = renderer.image { context in
//            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//        }
//
//
//        let rect = CGRect(origin: CGPoint.zero, size: view.size)
//        // 开启上下文
//        UIGraphicsBeginImageContext(view.size)
//        // 拿到上下文
//        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
//        // 取较小的边
//        //        let minSide = min(view.size.width, view.size.height)
//        //        // 是否圆角裁剪
//        //        if isCircle {
//        //            UIBezierPath(roundedRect: rect, cornerRadius: minSide*0.5).addClip()
//        //        }
//        // 设置填充颜色
//        ctx.setFillColor(UIColor.white.cgColor)
//        // 填充绘制
//        ctx.fill(rect)
//
//        // 得到图片
//        let bgImage = UIGraphicsGetImageFromCurrentImageContext()
//        // 关闭上下文
//        UIGraphicsEndImageContext()
//
//
//        let fullImage = composeImageWithLogo(bgImage: bgImage!, imageRect: [view.bounds], images: [image])!
//        return fullImage
    }
    
    func drawText(drawText text: String, writingDirection direction:EZWritingDirection, font: UIFont, textColor: UIColor, atPoint point: CGPoint) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)

        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        var writingDirection = [Any]()
        
        switch direction {
        case .leftToRight:
            paragraphStyle.alignment = .left
            writingDirection = [NSWritingDirection.leftToRight.rawValue]
            break
        case .natural:
            writingDirection = [NSWritingDirection.natural.rawValue]
            break
        case .rightToLeft:
            paragraphStyle.alignment = .right
            writingDirection = [NSWritingDirection.rightToLeft.rawValue]
            break
        }
        
        let textFontAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.writingDirection: writingDirection,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        
        
        let rect = CGRect(origin: point, size: self.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func drawLogo(imageName:String ,size:CGSize, left:CGFloat ,bottom:CGFloat) -> UIImage? {
        let image = UIImage(named: imageName)
        
        
        //以1.png的图大小为画布创建上下文
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))
        
        let height: CGFloat = CGFloat((self.cgImage?.height)!)

        //先把1.png 画到上下文中
        let x:CGFloat = left
        let y:CGFloat = height-(bottom+size.height)
        
        
        image!.draw(in: CGRect(x: x, y: y, width: size.width, height: size.height))
        
        //再把小图放在上下文中
        let resultImg: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        //从当前上下文中获得最终图片
        UIGraphicsEndImageContext()
        return resultImg!
    }
}
