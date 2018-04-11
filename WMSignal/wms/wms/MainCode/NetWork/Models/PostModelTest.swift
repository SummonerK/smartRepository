//
//  PostModelTest.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/14.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit
import ObjectMapper

class ModelTestPost: Reflect {
    var tag:String!     /// 1.  tag                说明
    var phone:String!   /// 2.  phone              手机号
}

class ModelListPost: Reflect {
    var tag:String!     /// 1.  tag                说明
    var phone:String!   /// 2.  phone              手机号
    var png:String!     /// 3.  image              手机号
}

//MARK:通用返回结构
/*
 *  statusCode:100
 *  msg:String
 */
class ModelCommonBack: Mappable {
    var msg: String?
    var ret: Int?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        ret <- map["ret"]
    }
    
    public var description: String {
        return self.msg!
    }
    
}
