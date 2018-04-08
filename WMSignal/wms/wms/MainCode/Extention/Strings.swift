//
//  Strings.swift
//  BanShengYuan
//
//  Created by Luofei on 2017/6/21.
//  Copyright © 2017年 Luofei. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - 字体设置
/// 系统普通字体
var IBFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.systemFont(ofSize: size);
}

func FontPFMedium(size:CGFloat)->UIFont{
    
//    return UIFont(name: "PingFangSC-Medium", size: size)!
    return IBFontWithSize(size)
    
}

func FontPFRegular(size:CGFloat)->UIFont{
    
    return UIFont(name: "PingFangSC-Regular", size: size)!
//    return IBFontWithSize(size)
    
}

func FontPFThin(size:CGFloat)->UIFont{
    
//    return UIFont(name: "PingFangSC-Thin", size: size)!
    return IBFontWithSize(size)
    
}

func FontPFLight(size:CGFloat)->UIFont{
    
//    return UIFont(name: "PingFangSC-Light", size: size)!
    return IBFontWithSize(size)
    
}

func FontLabelPFLight(size:CGFloat)->UIFont{
    
    return UIFont(name: "PingFangSC-Light", size: size)!
    
}

func FontLabelPFBold(size:CGFloat)->UIFont{
    
    return UIFont(name: "PingFangSC-Semibold", size: size)!
    
}


func mutableAttributedString(headIndent:CGFloat,lineSpaceing:CGFloat) ->NSMutableParagraphStyle{
    
    let style = NSMutableParagraphStyle()
    style.lineSpacing = lineSpaceing// 行距
    style.firstLineHeadIndent = headIndent// 缩进
    
    return style
    
}

//MARK:-设置底部画线的attributeString
func setCenterLineToString(tocolor:UIColor) -> [String:Any] {
    let firstAttributes = [NSForegroundColorAttributeName:tocolor,NSStrikethroughColorAttributeName: tocolor, NSStrikethroughStyleAttributeName:1,NSStrokeColorAttributeName:tocolor] as [String : Any]
    
    return firstAttributes
}

//MARK:-设置底部画线的attributeString
func setUnderLineToString(tocolor:UIColor) -> [String:Any] {
    let firstAttributes = [NSForegroundColorAttributeName:tocolor,NSUnderlineColorAttributeName: tocolor, NSUnderlineStyleAttributeName:1,NSStrokeColorAttributeName:tocolor] as [String : Any]
    
//    let firstAttributes = [NSForegroundColorAttributeName:tocolor] as [String : Any]
    
//    let firstAttributes = [NSForegroundColorAttributeName:tocolor,NSStrikethroughColorAttributeName: tocolor, NSStrikethroughStyleAttributeName:1,NSStrokeColorAttributeName:tocolor,NSFontAttributeName:FontPFLight(size: 12)] as [String : Any]
    
//    attributedString.addAttributes(firstAttributes, range: string.rangeOfString("Testing"))
    return firstAttributes
}

//numberStyle:
public enum Style : UInt {
    
    case none //1234567.89
    
    case decimal //1,234,567.89
    
    case currency //￥1,234,567.89
    
    case percent //123,456,789%
    
    case scientific //1.23456789E6
    
    case spellOut //一百二十三万四千五百六十七点八九
    
//    @available(iOS 9.0, *)
//    case ordinal //第123,4568
//    
//    @available(iOS 9.0, *)
//    case currencyISOCode //CNY1,234,567.89
//    
//    @available(iOS 9.0, *)
//    case currencyPlural//1,234,567.89人民币
//    
//    @available(iOS 9.0, *)
//    case currencyAccounting//￥1,234,567.89
    
}

extension String{
    
    func fixPrice() -> String {
        
        let formatter = NumberFormatter()
        let value = self.floatValue
        let format = NSMutableString(string: "###,##0.")
        let precision = 2
        if(precision == 0){
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value!/100))!
            
        }else{
            for _ in 1...precision
            {
                format.appendFormat("0")
            }
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value!/100))!
        }
        
    }
    
    func fixZeroPrice() -> String {
        
        let formatter = NumberFormatter()
        let value = self.floatValue
        let format = NSMutableString(string: "###,##0")
        let precision = 0
        if(precision == 0){
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value!/100))!
            
        }else{
            for _ in 1...precision
            {
                format.appendFormat("0")
            }
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value!/100))!
        }
        
    }
    
    func fixNumString() -> String {
        
        let acount:Float = self.floatValue!
        
        if acount == 0 || acount < 0 {
            return "0"
        }
        
        if acount > 10000 {
            return "\(String(format: "%.1f 万 ", (acount/10000)))"
        }
        
        return "\(String(format: "%.0f", (acount)))"
    }
    
    func fixZheString() -> String {
        
        let acount:Float = self.floatValue!
        
        if acount == 0 || acount < 0 {
            return "0"
        }
        
        if acount*100 >= 100 {
            return "\(String(format: "打折优惠券"))"
        }
        
        return "\(String(format: "%.0f", (acount*100)))"
    }
    
    
    /**
     根据 正则表达式 截取字符串
     
     - parameter regex: 正则表达式
     
     - returns: 字符串数组
     */
    public func matchesForRegex(regex: String) -> [String]? {
        
        do {
            let regularExpression = try NSRegularExpression(pattern: regex, options: [])
            let range = NSMakeRange(0, self.characters.count)
            let results = regularExpression.matches(in: self, options: [], range: range)
            let string = self as NSString
            return results.map { string.substring(with: $0.range)}
        } catch {
            return nil
        }
    }
    
    
    var array_items:[String]{
        
//        let regex = "<img\\b(?=\\s)(?=(?:[^>=]|='[^']*'|=\"[^\"]*\"|=[^'\"][^\\s>]*)*?\\ssrc=['\"]([^\"]*)['\"]?)(?:[^>=]|='[^']*'|=\"[^\"]*\"|=[^'\"\\s]*)*\"\\s?\\/?>"
//       
//        // 截取img标签
//        let resultItems = self.matchesForRegex(regex)
        
        let regex = "(http[^\\s]+(jpg|jpeg|png|tiff)\\b)"
        
        // 截取所有img url
        let resultItems = self.matchesForRegex(regex: regex)
        
//        for item in resultItems! {
//            let url = URL(string: item)
//            let imageV = UIImageView.init()
//            imageV.kf.setImage(with: url)
//        }
        
        return resultItems!
        
    }
    
    var array_itemPace:[String]{
        
        //        let regex = "<img\\b(?=\\s)(?=(?:[^>=]|='[^']*'|=\"[^\"]*\"|=[^'\"][^\\s>]*)*?\\ssrc=['\"]([^\"]*)['\"]?)(?:[^>=]|='[^']*'|=\"[^\"]*\"|=[^'\"\\s]*)*\"\\s?\\/?>"
        //
        //        // 截取img标签
        //        let resultItems = self.matchesForRegex(regex)
        
//        let regex = "(http[^\\s]+(jpg|jpeg|png|tiff)\\b)"
        
        // 截取所有img url
        let resultItems = self.components(separatedBy: "~")
        
        let array = NSMutableArray()
        
        
        for item in resultItems {
            
//            let url = URL(string: item)
//            let imageV = UIImageView.init()
//            imageV.kf.setImage(with: url)
            
            let item_temp = item.replacingOccurrences(of: "\r\n", with: "")
            
            array.add(item_temp)
            
        }
        
        return array as! [String]
        
    }
    //计算字串宽高
    func getLabSize(font:UIFont) -> CGSize {
        
        let statusLabelText: NSString = self as NSString
        
        let size = CGSize.init(width: IBScreenWidth-40, height: 900)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        
        return strSize
    }
    
    //计算字串宽高
    func getLabSize(font:UIFont, with Width:CGFloat) -> CGSize {
        
        let statusLabelText: NSString = self as NSString
        
        let size = CGSize.init(width: Width, height: 900)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        
        return strSize
    }
    
    var sectoryPhone:String{
        
        let a = NSString(string:self)
        let myNSRange = NSRange(location: 3, length: 4)
        let str = a.replacingCharacters(in: myNSRange, with: "****")
        
        return str
    }
    
    var floatValue: Float? {return NumberFormatter().number(from: self)?.floatValue}
    var doubleValue: Double? {return NumberFormatter().number(from: self)?.doubleValue}
    var intValue: Int? {return NumberFormatter().number(from: self)?.intValue}
    var int64Value: Int64? {return NumberFormatter().number(from: self)?.int64Value}
    
    /// string时间戳转换为指定日期格式字符串
    ///
    /// - parameter timestamp: 时间戳
    /// - parameter format:    格式
    ///
    /// - returns: 转换后字符串
    func transDataFromTimestamp(_ format:String = "yyyy年MM月dd日 HH:mm:ss") -> String {
       let dFormatter = DateFormatter()
        dFormatter.dateFormat = format
        let times = Int(self)
        if times != nil {
            return dFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(times!)))
        }
        return ""
    }
    
    func isTelNumber()->Bool{
        
        let eight = self.length-3
        var seven = self.length-4
        
        if self.length == 3{
            seven = 0
        }
        
        PrintFM("\(self) \(eight),\(seven)")
        
        let IBCM = String.init("^((13[0-2])|(14[5,6])|(15[5-6])|(166)|(17[0,1,5,6])|(18[5,6]))\\d{\(eight)}$|(1709)\\d{\(seven)}$")
        let IBCU = String.init("^((13[4-9])|(14[7,8])|(15[0-2,7-9])|(17[0,2,8])|(18[2-4,7-8])|(198))\\d{\(eight)}$|(1705)\\d{\(seven)}$")
        let IBCT = String.init("^((133)|(149)|(153)|(17[3,4,7,9])|(18[0,1,9])|(199))\\d{\(eight)}$|(1349)\\d{\(seven)}$")
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",IBCM!)
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,IBCU!)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,IBCT!)
        if ((regextestcm.evaluate(with: self) == true)
            || (regextestct.evaluate(with: self) == true)
            || (regextestcu.evaluate(with: self) == true))
        {
            return true
        }else{
            return false
        }
    }
    
    func isFullTelNumber()->Bool{
        
        if self.length < 11{
            return false
        }else{
            let eight = self.length-3
            var seven = self.length-4
            
            if self.length == 3{
                seven = 0
            }
            
            PrintFM("\(self) \(eight),\(seven)")
            
            let IBCM = String.init("^((13[0-2])|(14[5,6])|(15[5-6])|(166)|(17[0,1,5,6])|(18[5,6]))\\d{\(eight)}$|(1709)\\d{\(seven)}$")
            let IBCU = String.init("^((13[4-9])|(14[7,8])|(15[0-2,7-9])|(17[0,2,8])|(18[2-4,7-8])|(198))\\d{\(eight)}$|(1705)\\d{\(seven)}$")
            let IBCT = String.init("^((133)|(149)|(153)|(17[3,4,7,9])|(18[0,1,9])|(199))\\d{\(eight)}$|(1349)\\d{\(seven)}$")
            
            let regextestcm = NSPredicate(format: "SELF MATCHES %@",IBCM!)
            let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,IBCU!)
            let regextestct = NSPredicate(format: "SELF MATCHES %@" ,IBCT!)
            if ((regextestcm.evaluate(with: self) == true)
                || (regextestct.evaluate(with: self) == true)
                || (regextestcu.evaluate(with: self) == true))
            {
                return true
            }else{
                return false
            }
        }
        
    }
    
    var isPwd:Bool{
        
        let CHA = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$"
        let PWDCHAP = NSPredicate(format: "SELF MATCHES%@", CHA)
        
        return (PWDCHAP.evaluate(with: self))
        
    }
    
    
    var length: Int {
        return self.utf16.count
    }
}

extension Array{
    
    var toJsonString:String{
        
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: self, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
}

//import Foundation

class OKKbservable<T> {
    private var instance: T?
    
    var value: T? {
        get {
            return instance
        }
        set (newItem) {
            instance = newItem
            for listener in listeners {
                listener(instance)
            }
        }
    }
    
    private var listeners = [(T?) -> Void]()
    
    func addListener(handler: @escaping (T?) -> Void) {
        listeners.append(handler)
    }
}
