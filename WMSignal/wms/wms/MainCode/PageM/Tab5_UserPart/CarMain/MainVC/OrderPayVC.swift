//
//  OrderPayVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/20.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import MBProgressHUD

class OrderPayVC: UIViewController {
    
    var payValue:(finalPrice:Int,ordersn:String,type:Int)?
    //1订单付款 2活动报名
    @IBOutlet weak var bton_colorful: UIButton!
    
    @IBOutlet weak var label_finalPrice: UILabel!
    @IBOutlet weak var imageV_wx: UIImageView!
    @IBOutlet weak var imageV_al: UIImageView!
    var payChanel = 1
    
    //network
    
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    var paymentParam = ParamsPayment()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bton_colorful.gradientLayer(Width: IBScreenWidth)
        
        setPageValue()
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(wxaction(notification:)), name: NSNotification.Name(rawValue: "WXorderNotifation"), object: nil)
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(alaction(notification:)), name: NSNotification.Name(rawValue: "ALorderNotifation"), object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        //注销通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "WXorderNotifation"), object: nil)
    }
    
    //通知内容接收
    func wxaction(notification: NSNotification) {
        
        PrintFM("微信支付成功")
        
        if payValue?.type == 2{
            self.navigationController?.popViewController(animated: true)
        }else{
            //订单Menu
//            let Vc = StoryBoard_UserCenter.instantiateViewController(withIdentifier: "OrderMainVC") as! OrderMainVC
//            
//            self.navigationController?.pushViewController(Vc, animated: true)
        }
        
    }
    
    //通知内容接收
    func alaction(notification: NSNotification) {
        
        PrintFM("支付宝支付成功")
        
        if payValue?.type == 2{
            self.navigationController?.popViewController(animated: true)
        }else{
            //订单Menu
//            let Vc = StoryBoard_UserCenter.instantiateViewController(withIdentifier: "OrderMainVC") as! OrderMainVC
//            
//            self.navigationController?.pushViewController(Vc, animated: true)
        }
        
    }
    
    func setPageValue() {
        
        if let price = payValue?.finalPrice {
            
            let strPrice = "\(price)"
            
            PrintFM("\(strPrice)")
            
            label_finalPrice.text = String.init("¥ \(String(describing: strPrice.fixPrice()))")
        }
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
        
        let alert = UIAlertController(title: "提示", message: "确认离开收银台？", preferredStyle: .alert)
        
        let calcelAction = UIAlertAction(title: "继续支付", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "确认离开", style: .default, handler: { (UIAlertAction) in
            
            //跳转到订单页
            if self.payValue?.type == 2{
                self.navigationController?.popViewController(animated: true)
            }else{
                //订单Menu
//                let Vc = StoryBoard_UserCenter.instantiateViewController(withIdentifier: "OrderMainVC") as! OrderMainVC
//                
//                self.navigationController?.pushViewController(Vc, animated: true)
            }
            
        })
        
        // 添加
        alert.addAction(calcelAction)
        alert.addAction(deleteAction)
        
        // 弹出
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func actionWXPay(_ sender: Any) {
        
        if WXApi.isWXAppInstalled(){
        
            payChanel = 102
            imageV_wx.image = UIImage.init(named: "choose_s")
            imageV_al.image = UIImage.init(named: "choose_n")
        
        }else{
            HUDtextShow(toview: KeyWindow, msg: "未检测到微信", subMsg: "请选择其他支付方式，完成支付。")
        }
    
    }
    
    @IBAction func actionAliPay(_ sender: Any) {
        payChanel = 101
        imageV_wx.image = UIImage.init(named: "choose_n")
        imageV_al.image = UIImage.init(named: "choose_s")
        
        PrintFM("")
    }
    
    @IBAction func actionPay(_ sender: Any) {
        
        switch payChanel {
        case 1:
            HUDShowMsgQuick(msg: "请选择一种支付方式", toView: KeyWindow, time: 0.8)
            return
        case 101:
//            paymentParam.payment_type = 1
            break
        case 102:
//            paymentParam.payment_type = 2
            break
        default:
            return
        }
        
//        paymentParam.order_sn = payValue?.ordersn
//        
//        paymentParam.type = payValue?.type
//        
//        OrderM.shanShiNet_OrderPayment(amodel: paymentParam)
//            
//            .subscribe(onNext: { (result: ModelorderPay) in
//                
//                PrintFM("result \(String(describing: result.toJSONString()))")
//                
//                //支付宝支付
//                if self.payChanel == 101{
//                    
//                    AlipaySDK.defaultService().payOrder(result.biz_content, fromScheme: "bsy.shiji.al", callback: {(result) in
//                        
//                        if let resulttemp = result{
//                            if let status = resulttemp["resultStatus"]{
//                                if (status as! String) == "9000"{
//                                    
//                                    NotificationCenter.default.post(name: Notification.Name(rawValue: "ALorderNotifation"), object: nil)
//                                    
//                                }else{
//                                    HUDShowMsgQuick(msg: "支付失败", toView: KeyWindow, time: 0.8)
//                                }
//                                
//                            }
//                        }
//                        
//                    })
//                    
//                }
//                
//                //微信支付
//                if self.payChanel == 102{
//                    
//                    if let wxorder = result.pay_order{
//                        
//                        let paypost:PayReq = PayReq.init()
//                        paypost.openID = wxorder.appid!
//                        paypost.partnerId = "\(wxorder.mch_id!)"
//                        paypost.prepayId = wxorder.prepay_id!
//                        paypost.package = "\(wxorder.package!)"
//                        paypost.nonceStr = wxorder.nonce_str!
//                        paypost.timeStamp = UInt32(wxorder.timestamp!)!
//                        paypost.sign = wxorder.sign!
//                        WXApi.send(paypost)
//                        
//                    }
//                    
//                }
//                
//                
//            },onError:{error in
//                
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
