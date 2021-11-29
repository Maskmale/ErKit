//
//  NSObject+Extension.swift
//  Car
//
//  Created by Biligyar on 2020/11/26.
//

import UIKit


extension UILabel {
    
    @objc dynamic var setAppearanceFont : UIFont {
        set {
            self.font = newValue
        }
        get {
            return self.font
        }
    }
}


extension UIViewController {
    public class func initializeMethod() {
        if self != UIViewController.self {
            return
        }
        // Method Swizzling
        DispatchQueue.once(token: "ChangeIcon") {
            let orignal = class_getInstanceMethod(self, #selector(UIViewController.present(_:animated:completion:)))
            let swizzling = class_getInstanceMethod(self, #selector(UIViewController.jt_present(_:animated:completion:)))
            
            if let old = orignal, let new = swizzling {
                method_exchangeImplementations(old, new)
            }
        }
    }
    
    @objc private func jt_present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        // 在这里判断是否是更换icon时的弹出框
        if viewControllerToPresent is UIAlertController {
            
            let alertTitle = (viewControllerToPresent as! UIAlertController).title
            let alertMessage = (viewControllerToPresent as! UIAlertController).message
            
            // 更换icon时的弹出框，这两个string都为nil。
            if alertTitle == nil && alertMessage == nil {
                return
            }
        }
        
        // 因为方法已经交换，这个地方的调用就相当于调用原先系统的 present
        self.jt_present(viewControllerToPresent, animated: flag, completion: completion)
    }
}


extension DispatchQueue {
    private static var _onceTracker = [String]()
    public class func once(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}



// MARK: - CastingError

struct CastingError: Error {
    let fromType: Any.Type
    let toType: Any.Type
    init<FromType, ToType>(fromType: FromType.Type, toType: ToType.Type) {
        self.fromType = fromType
        self.toType = toType
    }
}

extension CastingError: LocalizedError {
    var localizedDescription: String { return "Can not cast from \(fromType) to \(toType)" }
}

extension CastingError: CustomStringConvertible { var description: String { return localizedDescription } }

/**
 let value1 = try? data!.toDictionary()
 let value2 = try? data!.to(type: [String: Any].self)
 let value4 = try? string.asJSONToDictionary()
 let value5 = try? string.asJSON(to: [String: Any].self)
 */


// FIXME: - 需要整理一下 Extension
//MARK: - Data Extension
/**
 let result = try? data!.toDictionary()
 let result = try? data!.to(type: [String: Any].self)
 */
//
extension Data {
    
    func toDictionary(options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        return try to(type: [String: Any].self, options: options)
    }

    func to<T>(type: T.Type, options: JSONSerialization.ReadingOptions = []) throws -> T {
        guard let result = try JSONSerialization.jsonObject(with: self, options: options) as? T else {
            throw CastingError(fromType: type, toType: T.self)
        }
        return result
    }
}


//MARK: - Dictionary Extension
extension Dictionary {
    
    func toData(options: JSONSerialization.WritingOptions = []) throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: options)
    }
}


//MARK: - String Extension
/**
 let result = try? string.asJSONToDictionary()
 let result = try? string.asJSON(to: [String: Any].self)
 */
//
extension String {
    
    func asJSON<T>(to type: T.Type, using encoding: String.Encoding = .utf8) throws -> T {
        guard let data = data(using: encoding) else { throw CastingError(fromType: type, toType: T.self) }
        return try data.to(type: T.self)
    }

    func asJSONToDictionary(using encoding: String.Encoding = .utf8) throws -> [String: Any] {
        return try asJSON(to: [String: Any].self, using: encoding)
    }
    
}


extension String {
    
    func toERDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
          do {
            return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:AnyObject]
          } catch let error as NSError {
            print(error)
          }
        }
        return nil
    }
    
}

extension Dictionary {
    
    func toERString() -> String {
        var result:String = ""
        do {
            //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
    
}

extension Array {
    
    func toERString() -> String {
        var result:String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
    
}
