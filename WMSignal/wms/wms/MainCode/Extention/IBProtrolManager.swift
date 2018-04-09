//
//  IBProtrolManager.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/26.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import Foundation
import UIKit

/**
 *发现页面>推荐分栏目>品牌市集
 *代理内容，点击到的品牌市集 indexPath
 */
protocol IBFoundTOPDelegate {
    func foundTopPinpaishijiSelected(_ indexPath: IndexPath)
}

/**
 *店铺页面>优惠券分栏目>领取优惠券
 */
protocol IBStoreQuanDelegate {
    func StoreQuanSelected(_ indexPath: IndexPath)
}

/**
 *市集详情 头部视图 返回 分享代理
 *
 */
protocol IBShiJiHeadDelegate {
    func HeadSelected(_ info:Int)
}

/**
 *市集详情 头部视图 返回 分享代理
 *
 */
protocol IBReNaoCoverDelegate {
    func CoverSelected(_ info:Int,_ phone:String)
}


/**
 *精选页面>推荐分栏目>品牌市集
 *代理内容，点击到的品牌市集 indexPath
 */
protocol IBFeaturedTOPDelegate {
    func FeaturedTopPinpaishijiSelected(_ superIndexPath: IndexPath,_ indexPath:IndexPath)
}

/**
 *精选页面>产品分类>品牌市集
 *代理内容，点击到的品牌市集 indexPath
 */
protocol IBFeaProductTOPDelegate {
    func FeaProductSelected(_ pageIndex: Int,_ indexPath:IndexPath)
}

/// 精选更多按钮代理 入参：点击的indexrow
protocol IBFeatureMoreDelegate {
    func moreBtnClicked(index: Int)
}

//MARK: -[精选item中collec item点击]
protocol IBFeatureCollecItemDelegate {
    
    func itemClicked(superIndex: Int,itemIndex: Int)
}

///规格页面选择代理

enum IBGoodsCoverActionType {
    case ADD  //加数量
    case Fls   //减数量
    case CLOSE //关闭
    case OPEN  //打开规格
}

protocol IBGoodsCoverVDelegate{
    func setAction(actionType:IBGoodsCoverActionType)
}

///订单详情页面Type

enum IBOrderDetailType {
    case waitePush
    case waitePay
    case waiteGet
    case successPay
    case success
    case close
    
    case selfWaitePay
    case selfSuccessPay
    case selfSuccess
    case selfClose
    
    case offlineWaitePay
    case offlineSuccess
    case offlineClose

    case OffLine
}

///收货地址 Type
enum AddressActionType {
    case SET
    case EDIT
    case DELETE
}

protocol UserAddressDelegate{
    func setAction(indexPath:IndexPath, actionType:AddressActionType)
}

enum UserMainActionType {
    case Logout
    case NoticeV
}
protocol UserMainDelegate{
    func userMainAction(actionType:UserMainActionType)
}

//订单底部按钮代理

enum IBOrderBottomAction {
    case ordercancel//取消订单
    case orderPay//前往支付
    case orderNotice//提醒发货
    case orderPostinfo//查看物流
    case orderReceive//确认收货
    case orderComment//订单评价
    case orderDelete//删除订单
}

protocol orderBottomDelegate{
    func setBottomAction(section:Int, actionType:IBOrderBottomAction)
    func orderTouchAction(section:Int)
}

//结算确认页

enum ConfirmActionType {
    case postStyle
    case ticketChoose
}

protocol orderConfirmDelegate{
    func setConfirmAction(section:Int, actionType:ConfirmActionType)
}

/**
 *主页>part1
 *代理内容，0 最新资讯；1-8 对应网格按钮
 */
protocol MainPart1Delegate{
    func setMainPart1Action(actionType:Int)
}

/**
 *主页>part1
 *代理内容，0-订单，1-4-对应网格
 */
protocol UserPart1Delegate{
    func setUserPart1Action(actionType:Int)
}


