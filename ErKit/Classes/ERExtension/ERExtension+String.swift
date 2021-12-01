//
//  ERExtension+String.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import UIKit

// MARK: - String
extension String {

    func ga_widthForComment(font: UIFont, height: CGFloat = 15) -> CGFloat {
        let font = font
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    func ga_heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
        let font = font
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }
    
    func ga_heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
    
    
    
    /*
     * Range 转 NSRange
     */
    func toNSRange(_ range: Range<String.Index>) -> NSRange {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else {
            return NSMakeRange(0, 0)
        }
        return NSMakeRange(utf16.distance(from: utf16.startIndex, to: from), utf16.distance(from: from, to: to))
    }
    
    /*
     * NSRange 转 Range
     */
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
    
    
    /*
     *去掉首尾空格
     */
    var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉首尾空格 包括后面的换行 \n
     */
    var removeHeadAndTailSpacePro:String {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉所有空格
     */
    var removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    /*
     *去掉首尾空格 后 指定开头空格数
     */
    func beginSpaceNum(num: Int) -> String {
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.removeHeadAndTailSpacePro
    }
    
    /*
     *替换手机号中间四位 Returns: 替换后的值
     */
    func replacePhone() -> String {
        let start = self.index(self.startIndex, offsetBy: 3)
        let end = self.index(self.startIndex, offsetBy: 7)
        let range = Range(uncheckedBounds: (lower: start, upper: end))
        return self.replacingCharacters(in: range, with: "****")
    }
    
    /*返回第一次出现的指定子字符串在此字符串中的索引
     *（如果backwards参数设置为true，则返回最后出现的位置）
     */
    func positionOf(sub:String, backwards:Bool = false)->Int {
        var pos = -1
        if let range = range(of:sub, options: backwards ? .backwards : .literal ) {
            if !range.isEmpty {
                pos = self.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
    
    /*返回字符串所在位置
     *
     */
    func ranges(of string: String) -> [Range<String.Index>] {
        var rangeArray = [Range<String.Index>]()
        var searchedRange: Range<String.Index>
        guard let sr = self.range(of: self) else {
            return rangeArray
        }
        searchedRange = sr
        
        var resultRange = self.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        while let range = resultRange {
            rangeArray.append(range)
            searchedRange = Range(uncheckedBounds: (range.upperBound, searchedRange.upperBound))
            resultRange = self.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        }
        return rangeArray
    }
    
    func nsrange(fromRange range : Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    
    func nsranges(of string: String) -> [NSRange] {
        return ranges(of: string).map { (range) -> NSRange in
            self.nsrange(fromRange: range)
        }
    }
    
}

// MARK: - Color
private extension String {
    
    private var pureHexColor: String {
        return trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
    }
    
    struct RGBColor {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
    }
    
    var rgbColor: RGBColor? {
        if pureHexColor.count == 6 {
            return pureHexColor.rgbColorFrom6Hex()
        } else if pureHexColor.count == 8 {
            return pureHexColor.rgbColorFrom8Hex()
        } else {
            return nil
        }
    }
    
    private func rgbColorFrom6Hex() -> RGBColor? {
        guard let rgb = hexToInt32() else { return nil }
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        return RGBColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func rgbColorFrom8Hex() -> RGBColor? {
        guard let rgb = hexToInt32() else { return nil }
        let red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
        let green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
        let blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
        let alpha = CGFloat(rgb & 0x000000FF) / 255.0
        return RGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func hexToInt32() -> UInt32? {
        var rgb: UInt32 = 0
        guard Scanner(string: self).scanHexInt32(&rgb) else { return nil }
        return rgb
    }

}

    // MARK: - 字符串截取
extension String {
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[3] // c
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    
    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    
    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    
    // 截取 从头到i位置
    func substring(to:Int) -> String{
        return self[0..<to]
    }
    
    // 截取 从i到尾部
    func substring(from:Int) -> String{
        return self[from..<self.count]
    }
    
//    //分割字符
//    func split(s:String)->String[]{
//        if s.isEmpty{
//            var x=String[]()
//            for y in self{
//                x.append(String(y))
//            }
//            return x
//        }
//        return self.componentsSeparatedByString(s)
//    }
//    //去掉左右空格
//    func trim()->String{
//        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
//    }
//    //是否包含字符串
//    func has(s:String)->Bool{
//        if self.rangeOfString(s) {
//            return true
//        }else{
//            return false
//        }
//    }
//    //是否包含前缀
//    func hasBegin(s:String)->Bool{
//        if self.hasPrefix(s) {
//            return true
//        }else{
//            return false
//        }
//    }
//    //是否包含后缀
//    func hasEnd(s:String)->Bool{
//        if self.hasSuffix(s) {
//            return true
//        }else{
//            return false
//        }
//    }
//    //统计长度
//    func length()->Int{
//        return countElements(self)
//    }
//    //统计长度(别名)
//    func size()->Int{
//        return countElements(self)
//    }
//    //截取字符串
//    func substr(range:Int...)->String{
//        if range[0]==0{
//            return self.substringToIndex(range[1])
//        }else{
//            return self.substringFromIndex(range[0])
//        }
//    }
//    //重复字符串
//    func repeat(times: Int) -> String{
//        var result = ""
//        for i in 0..times {
//            result += self
//        }
//        return result
//    }
//    //反转
//    func reverse()-> String{
//        var s=self.split("").reverse()
//        var x=""
//        for y in s{
//            x+=y
//        }
//        return x
//    }
    
    
    private func convertToDictionary() -> [String: Any]? {
        if let data = data(using: .utf8) {
            return try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
        return nil
    }
}

extension String{
    
    public func getHeight(font:UIFont, maxWidth: CGFloat) -> CGFloat {
        
        
        
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let size = CGSize(width: maxWidth, height: CGFloat(MAXFLOAT))
        let rect:CGRect = self.boundingRect(with: size, options: option, attributes: attributes, context: nil)

        return rect.height;
    }
    
    public func getWidth(font:UIFont, maxHeight: CGFloat) -> CGFloat {

        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let size = CGSize(width: CGFloat(MAXFLOAT), height: maxHeight)
        let rect:CGRect = self.boundingRect(with: size, options: option, attributes: attributes, context: nil)

        return rect.width;
    }
    
    //MARK:获得string内容高度
    func stringHeightWith(font: UIFont, width: CGFloat, lineSpace : CGFloat) -> CGFloat{
        
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpace
        
        paragraphStyle.lineBreakMode = .byWordWrapping;
        
        let attributes = [NSAttributedString.Key.font:font, NSAttributedString.Key.paragraphStyle:paragraphStyle.copy()]
        
        let text = self as NSString
        
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.height
        
    }
    
}
