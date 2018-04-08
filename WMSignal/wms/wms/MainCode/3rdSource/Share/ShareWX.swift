//
//  ShareWX.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2018/3/1.
//  Copyright © 2018年 FreeMud. All rights reserved.
//

import UIKit

let ShareManager = ShareWX.shared

let ShareBasePath = "http://ssapp.sandload.cn/api/share/"  //api

let shareFTitle = "市集  好玩的市集每天逛"
let shareFContent = "用你喜欢的方式，逛遍整个市集。"

let shareHTitle = "热闹  好玩的市集每天逛"
let shareHContent = "吃喝玩逛全不同？嘿，我只想给你点好玩的！"

///收货地址 Type
enum ShareActionType {
    case HotShare
    case FairShare
    case NormalShare
}

struct shareMent {
    let id:String?
    let title:String?
    let content:String?
    var withType = ShareActionType.NormalShare
    let shareIcon:UIImage?
}

class ShareWX: NSObject {
    
    //发送给好友还是朋友圈（默认好友）
    var _scene = Int32(WXSceneSession.rawValue)
    var _sceneCircle = Int32(WXSceneTimeline.rawValue)
    
    static let shared = ShareWX()
    // 重载并私有
    private override init() {
        PrintFM("create share 单例")
    }
    
    func showShareView(shareItem:shareMent){
        
        let shareView = Bundle.main.loadNibNamed("ShareView", owner: nil, options: nil)?.first as? ShareView
        
        shareView?.frame = CGRect.init(x: 0, y: 0, width: IBScreenWidth, height: IBScreenHeight)
        
        shareView?.showShareView(rootview: KeyWindow, shareItem: shareItem)
        
    }
    
    func shareAppToFriend(shareItem:shareMent){
        
        var extentionShare = String.init()
        
        let message =  WXMediaMessage()
        
        switch shareItem.withType {
        case .HotShare:
            extentionShare.append("hot/\(shareItem.id ?? "")")
            message.title = shareHTitle
            message.description = shareHContent
            break
        case .FairShare:
            extentionShare.append("town/\(shareItem.id ?? "")")
            message.title = shareFTitle
            message.description = shareFContent
            break
        case .NormalShare:
            break
        }
        
        PrintFM("extentionShare = \(extentionShare)")
        
        if WXApi.isWXAppInstalled(){
            
        }else{
            HUDtextShow(toview: KeyWindow, msg: "未检测到微信", subMsg: "请选择其他分享方式")
            return
        }
        
        
//        message.title = shareItem.title
//        message.description = shareItem.content
//        message.setThumbImage(shareItem.shareIcon)
        
        message.setThumbImage(shareItem.shareIcon)
        
        let ext =  WXWebpageObject()
        ext.webpageUrl = ShareBasePath + extentionShare
//        ext.webpageUrl = "www.baidu.com"
        message.mediaObject = ext
        
        let req =  SendMessageToWXReq()
        req.bText = false
        req.message = message
        req.scene = _scene
        WXApi.send(req)
    }
    
    func shareAppToCircle(shareItem:shareMent) {
        
        var extentionShare = String.init()
        
        let message =  WXMediaMessage()
        
        switch shareItem.withType {
        case .HotShare:
            extentionShare.append("hot/\(shareItem.id ?? "")")
            message.title = shareHTitle
            message.description = shareHContent
            break
        case .FairShare:
            extentionShare.append("town/\(shareItem.id ?? "")")
            message.title = shareFTitle
            message.description = shareFContent
            break
        case .NormalShare:
            break
        }
        
        PrintFM("extentionShare = \(extentionShare)")
        
        if WXApi.isWXAppInstalled(){
            
        }else{
            HUDtextShow(toview: KeyWindow, msg: "未检测到微信", subMsg: "请选择其他分享方式")
            return
        }
        
        message.setThumbImage(shareItem.shareIcon)
        
        let ext =  WXWebpageObject()
        ext.webpageUrl = ShareBasePath + extentionShare
//        ext.webpageUrl = "www.baidu.com"
        message.mediaObject = ext
        
        let req =  SendMessageToWXReq()
        req.bText = false
        req.message = message
        req.scene = _sceneCircle
        WXApi.send(req)
    }

}
