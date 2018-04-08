//
//  ModelOrder.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/20.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class ModelOrder: NSObject {

}

//MARK:创建订单 postmodel

class ModelOrderCreatePost: Mappable {
    var address_id:String?           //partnerId
    var detail:String?     //订单商品
    var is_selffetch:Int?     //0配送  1上门自提，默认为0
    
    init() {
        
    }
    
    required init?(map: Map) { }
    func mapping(map: Map) {
        
        address_id <- map["address_id"]
        detail <- map["detail"]
        is_selffetch <- map["is_selffetch"]
        
    }
    
}

//MARK:门店下单 postmodel

class ModelStoreOrderCreatePost: Mappable {
    var store_id:String?   //门店id
    var amount:String?     //订单金额
    var coupon_id:Int?   //优惠劵id  若没有用到优惠劵则为0
    var no_discount:String? //不参与优惠金额
    
    init() { }
    
    required init?(map: Map) { }
    func mapping(map: Map) {
        
        store_id <- map["store_id"]
        amount <- map["amount"]
        coupon_id <- map["coupon_id"]
        no_discount <- map["no_discount"]
        
    }
    
}

class OrderShopItemReq:Mappable {
    var store_id:String?           //商品id
    var store_name:String?         //商品名字
    var product:[OrderProductItemReq]?              //商品数量
    var ticket_id:String?       //单位
    var remark:String?               //价格
    
    init() {}
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        store_id <- map["store_id"]
        store_name <- map["store_name"]
        product <- map["product"]
        ticket_id <- map["ticket_id"]
        remark <- map["remark"]
    }
}

class OrderProductItemReq:Mappable {
    var goods_id:Int?           //商品id
    var goods_sku:String?         //商品SKU
    var number:Int?              //商品数量
    
    init() {
        
    }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        goods_id <- map["goods_id"]
        goods_sku <- map["goods_sku"]
        number <- map["number"]
    }
}

//MARK:订单支付 postmodel

class ModelOrderPayPost: Reflect {
    /**
     *  订单ID
     *  必传:True
     */
    var orderId:String!
    /**
     *  支付渠道编码
     *  必传:True
     */
    var pay_ebcode:String!
    
}

//MARK:订单支付 backModel

class modelPayPlanBack:Mappable {
    var errcode:String?
    var errmsg:String?
    var data:ModelorderPay?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        errcode <- map["errcode"]
        errmsg <- map["errmsg"]
        data <- map["data"]
    }
    
}

class ModelorderPay: Mappable {

    var msg: String?//返回支付信息
    var statusCode: String?//支付方式描述
    var pay_id: String?//返回支付信息
    var biz_content: String?//支付账户
    var pay_transId: String?//支付账户
    
    var pay_order: ModelorderWXItem?//微信支付model信息
    var pay_acount: String?//支付账户
    var pay_ebcode: String?//支付方式描述
    
    var fmId: String?//支付方式描述
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        biz_content <- map["biz_content"]
        fmId <- map["fmId"]
        msg <- map["msg"]
        
        pay_acount <- map["pay_acount"]
        pay_ebcode <- map["pay_ebcode"]
        pay_id <- map["pay_id"]
        pay_order <- map["pay_order"]
        
        pay_transId <- map["pay_transId"]
        statusCode <- map["statusCode"]
        
    }
    
    public var description: String {
        return self.toJSONString()!
    }
    
}

class ModelorderWXItem: Mappable {
    var appid: String?
    var mch_id: String?
    var nonce_str: String?
    var package: String?
    
    var prepay_id: String?
    var sign: String?
    var pay_id: String?
    var timestamp: String?
    
    var trade_type: String?
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        appid <- map["appid"]
        mch_id <- map["mch_id"]
        nonce_str <- map["nonce_str"]
        package <- map["package"]
        
        prepay_id <- map["prepay_id"]
        sign <- map["sign"]
        pay_id <- map["pay_id"]
        timestamp <- map["timestamp"]
        
        trade_type <- map["trade_type"]
        
    }
    
    public var description: String {
        return self.toJSONString()!
    }
    
}
