//
//  ERUIBarButtonItemExtension.swift
//  NurKeyboard
//
//  Created by Erbash on 2020/12/19.
//

import UIKit

//MARK: - UIBarButtonItem Extension
extension UIBarButtonItem {
    class func ERItem(imageName: String, highlightedImageName: String, selectedImageName: String, target:Any,
        action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom);
        //如果 imageName 不为 nil
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        //如果 highlightedImageName 不为 nil
        btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)

        //如果 selectedImageName 不为 nil
        btn.setImage(UIImage(named: selectedImageName), for: .selected)
        
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        let containView = UIView.init(frame: btn.bounds)
        containView.addSubview(btn)
        
        return UIBarButtonItem.init(customView: containView)
    }
    
    class func ERItem(imageName: String, highlightedImageName: String, target:Any,
        action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom);
        //如果 imageName 不为 nil
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        //如果 highlightedImageName 不为 nil
        btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)

        
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        let containView = UIView.init(frame: btn.bounds)
        containView.addSubview(btn)
        
        return UIBarButtonItem.init(customView: containView)
    }
    
    class func ERItem(imageName: String, selectedImageName: String, target:Any,
        action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom);
        //如果 imageName 不为 nil
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        //如果 selectedImageName 不为 nil
        btn.setImage(UIImage(named: selectedImageName), for: .selected)
        
        
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        let containView = UIView.init(frame: btn.bounds)
        containView.addSubview(btn)
        
        return UIBarButtonItem.init(customView: containView)
    }
    
    class func ERBackItem(imageName: String, highlightedImageName: String,title: String, target:Any,
        action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom);
        //如果 imageName 不为 nil
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        //如果 highlightedImageName 不为 nil
        btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        btn.addTarget(target, action: action, for: .touchUpInside)
        let containView = UIView.init(frame: btn.bounds)
        containView.addSubview(btn)
        
        //MARK: - SuportRTL
        if UIView.appearance().semanticContentAttribute == .forceLeftToRight {
            let t = CGAffineTransform(scaleX: -1, y: 1)
            containView.transform = t
        }
        
        return UIBarButtonItem.init(customView: containView)
    }
}
