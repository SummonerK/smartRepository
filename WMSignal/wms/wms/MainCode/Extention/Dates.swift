//
//  Dates.swift
//  BanShengYuan
//
//  Created by Luofei on 2017/6/21.
//  Copyright © 2017年 Luofei. All rights reserved.
//

import Foundation

import UIKit

extension Date{
    
    var SignTimeSP:String{
//        let timeInterval = self.timeIntervalSince1970 * 100000
        let timeInterval = self.timeIntervalSince1970
        let timesp = Int(timeInterval)
        return "\(timesp)"
    }
    
    var SignTimeSPINT:String{
        let timeInterval = self.timeIntervalSince1970
        let timesp = Int(timeInterval)*1000
        return "\(timesp)"
    }
    
    static func date_form(str: String?) -> Date? {
        
        return self.date_from(str: str, formatter: "yyyy-MM-dd HH:mm:ss")
    }
    
    static func date_from(str: String?, formatter: String?) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        if let da_formatter = formatter {
            dateFormatter.dateFormat = da_formatter
            if let time_str = str {
                let date = dateFormatter.date(from: time_str)
                return date
            }
        }
        return nil
    }
    
    func string_from(formatter: String?) -> String {
        
        if let format = formatter {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = format
            let date_str = dateFormatter.string(from: self)
            return date_str
        }
        return ""
    }
    
}

extension Int{
    var timeSPData:Date{
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
    
    var FixDistance:String{
        if self < 1000 && self >= 0{
            return String(format: "%d m", self)
        }else if self > 1000{
            return String(format: "%.2f km", Float(self)/1000)
        }else{
            return "雷达扫描中.."
        }
    }
    
}

extension String{

    var timeSPData:Date{
        return Date(timeIntervalSince1970: TimeInterval(self.intValue!))
    }
    
    //只能为数字 带小数点两位
    func onlyInputTheNumber() -> Bool {
        
        PrintFM("acount = \(self)")
        
        let expression = "^(([1-9]{1})|([0-9]{0,5}))(\\.(\\d){0,2})?$"
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",expression)
        
        if regextestcm.evaluate(with: self){
            return true
        }else{
            return false
        }
        
    }
    
}


