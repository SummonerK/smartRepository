//
//  ConfirmOrderVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/13.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import IQKeyboardManagerSwift

class ConfirmOrderVC: UIViewController {
    
    @IBOutlet weak var view_TabV: UIView!
    
    @IBOutlet weak var tableViewMain:UITableView!
    
    @IBOutlet weak var label_totalprice: UILabel!
    
    @IBOutlet weak var bton_colorful: UIButton!
    
    var view_line: UIView!
    
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    var modelOrderC = ModelOrderCreatePost()           //订单model
//    var modelAddressList = ParamsReceivingAddressList()           //收货地址列表Param
//    //post
//    
//    var defaultAddress = AddressListItemInfo()            ///默认收货地址
//    {
//        didSet{
//            tableViewMain.reloadData()
//        }
//    }
//    
    var pageSlider:Int? = 0
    {
        didSet{
//            modelOrderC.is_selffetch = pageSlider
            sliderTo(page: pageSlider!)
        }
    }
//
//    var pushVaule:(page:Int,arrayToPush:[ScarListItem])?
//    
//    var TotalPrice:Int = 0{
//        didSet{
//            let str = String(describing: TotalPrice)
//            label_totalprice.text = String.init("¥ \(String(describing: str.fixPrice()))")
//        }
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bton_colorful.gradientLayer(Width: IBScreenWidth*0.34)
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        IQKeyboardManager.sharedManager().enable = true
        
        tableViewMain.register(UINib.init(nibName: "TCellOrderListGood", bundle: nil), forCellReuseIdentifier: "TCellOrderListGood")
        
//        setTabV ()
//        
//        fixTotalPrice()
//        
//        LoadAddressListData()
//        
//        pageSlider = 0
    }
    
//    func setTabV (){
//        let startX = (IBScreenWidth*0.5-20)/2 - 22.5 + 20
//        
//        view_line = UIView.init(frame: CGRect.init(x: startX, y: 42, width: 45, height: 2))
//        
//        view_TabV.addSubview(view_line)
//        
//        view_line.backgroundColor = FlatLocalGlod
//        
//        setRadiusFor(toview: view_line, radius: 1, lineWidth: 0, lineColor: UIColor.clear)
//    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func headTab1Action(_ sender: Any) {
//        pageSlider = 0
    }
    
    @IBAction func headTab2Action(_ sender: Any) {
//        pageSlider = 1
    }
    
    @IBAction func submitOrderAction(_ sender: Any) {
        
//        let arrayStore = NSMutableArray()
//        
//        for item in (pushVaule?.arrayToPush)!{
//            
//            let plist = item.list
//            
//            let arrayPro = NSMutableArray()
//            
//            for pro in plist!{
//                
//                let aProduct = OrderProductItemReq()
//                
//                aProduct.goods_id = pro.goods_id
//                aProduct.goods_sku = pro.goods_sku
//                aProduct.number = pro.number
//                
//                arrayPro.add(aProduct)
//            }
//            
//            let ashop = OrderShopItemReq()
//            ashop.store_id = item.store_id?.description
//            ashop.store_name = item.stoer_name
//            if item.defaultTicket != nil {
//                ashop.ticket_id = item.defaultTicket?.id?.description
//            }else{
//                ashop.ticket_id = ""
//            }
//            ashop.remark = item.content
//            ashop.product = arrayPro as? [OrderProductItemReq]
//            
//            arrayStore.add(ashop)
//            
//        }
//        
//        modelOrderC.address_id = defaultAddress.id?.description
//        modelOrderC.detail = (arrayStore as? [OrderShopItemReq])?.toJSONString()
//        
//        PrintFM("modelOrderC = \(String(describing: modelOrderC.toJSONString()))")
//        
//        OrderM.shanShiNet_OrderSubmit(amodel: modelOrderC)
//            .subscribe(onNext: { (posts: ModelOrderCreateBack) in
//                
//                if let modeldata = posts.data,let ordersn = modeldata.order_sn,let totalFee = modeldata.total_fee{
//                    //前往支付
//                    
//                    let VC = OrderPayVC(nibName: "OrderPayVC", bundle: nil)
//                    
//                    VC.payValue = (totalFee,ordersn,1) as (finalPrice: Int, ordersn: String, type: Int)
//                    
//                    self.navigationController?.pushViewController(VC, animated: true)
//                    
//                    
//                }
//                
//            },onError:{error in
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
//        
        
    }
    
    func LoadAddressListData(){
        
//        OrderM.shanShiNet_ReceivingAddressList(amodel: modelAddressList)
//            .subscribe(onNext: { (posts: modelAddressListBack) in
//                if let data = posts.data,let list = data.list{
//                    
//                    for item:AddressListItemInfo in list{
//                    
//                        if item.is_default == 2{
//                            
//                            self.defaultAddress = item
//                            
//                            break
//                            
//                        }
//                    }
//                    
//                }
//                
//            },onError:{error in
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
    }
    
    
    func fixTotalPrice(){
        
//        var totalPrice:Int = 0
//        
//        for i in 0..<(pushVaule?.arrayToPush.count ?? 0) {
//            
//            let storeItem = pushVaule?.arrayToPush[i]
//            
//            var postFee = 0
//            
//            var useFee = 0
//            
//            for item in storeItem?.list ?? [] {
//                
//                let goodsFee = (item.goods_price! * item.number!)
//                
//                useFee = useFee + goodsFee
//                
//            }
//            
//            storeItem?.shopTotalPrice = useFee
//            
//            
//            ////计算运费 优惠项
//            
//            if pageSlider == 1 {
//                
//                postFee = 0
//                
//            }else{
//                
//                if storeItem?.shop_freight_config?.freight == 1{
//                    
//                    if useFee >= (storeItem?.shop_freight_config?.free_shipping_price ?? 0){
//                        postFee = 0
//                    }else{
//                        postFee = (storeItem?.shop_freight_config?.shipping_price ?? 0)
//                    }
//                    
//                }else if storeItem?.shop_freight_config?.freight == 2{
//                    
//                    postFee = 0
//                    
//                }
//                
//            }
//            
//            storeItem?.postFee = postFee
//            
//            if let defaultTicket = storeItem?.defaultTicket {
//                
//                if let finalValue = defaultTicket.end_val,let startValue = defaultTicket.start_val {
//                    
//                    let final = Int(finalValue * 100)
//                    
//                    //满减券
//                    if defaultTicket.type == 1,useFee >= Int(startValue*100){
//                        useFee = useFee - Int(finalValue*100)
//                    }else if defaultTicket.type == 2,useFee >= Int(startValue*100){     //折扣券
////                        useFee = useFee -  Int(Float(useFee)*(1-finalValue))
//                        useFee = useFee*final/100
//                    }
//                }
//                
//            }
//            
//            var totalFee = 0 //实际商品费用
//            
//            if pageSlider == 1{ // 自提订单无配送费
//                totalFee = useFee
//            }else{
//                totalFee = useFee + postFee
//            }
//            
//            storeItem?.shopFinalPrice = totalFee
//            
//            totalPrice = totalPrice + (storeItem?.shopFinalPrice)!
//            
//        }
//        
//        TotalPrice = totalPrice
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderTo(page:Int) {
        
        
        let startX = (IBScreenWidth*0.5-20)/2 - 22.5 + 20
        
//        UIView.animate(withDuration: 0.6) {
        
        self.view_line.frame = CGRect.init(x: startX + CGFloat(page)*(IBScreenWidth*0.5-20), y: 42, width: 45, height: 2)
        
        self.tableViewMain.reloadData()
        
        fixTotalPrice()
        
//        }
        
    }
    
    /// HeaderFooter Actions
    
    func gotoAddressVC() {
        PrintFM("")
        //收货地址
//        let Vc = AddressChooseVC(nibName: "AddressChooseVC", bundle: nil)
//        
//        Vc.addressB = addressBack(_:)
//        
//        self.navigationController?.pushViewController(Vc, animated: true)
    }
    
//    
//    func addressBack(_ back:AddressListItemInfo) -> Void {
//        
////        if (back.id != nil) {
////            self.defaultAddress = back
////        }else{
////            self.LoadAddressListData()
////        }
//        
//    }
    
}

//extension ConfirmOrderVC:orderConfirmDelegate{
//    func setConfirmAction(section:Int, actionType:ConfirmActionType){
//        
////        let sectionItem = pushVaule?.arrayToPush[section]
////        
////        if actionType == .postStyle{
////            PrintFM("选取运送")
////        }
////        
////        if actionType == .ticketChoose{
////            PrintFM("")
////            
////            if let storeid = sectionItem?.store_id{
////                
////                let Vc = TicketChooseVC(nibName: "TicketChooseVC", bundle: nil)
////                
////                Vc.useValue = (storeid.description,0) as? (storeId: String, totalFee: Int)
////                
////                Vc.choosedTicket = sectionItem?.defaultTicket
////                
////                Vc.ticketB = {(back:TicketListItemInfo?) in
////                    sectionItem?.defaultTicket = back
////
////                    self.fixTotalPrice()
////                    
////                    self.tableViewMain.reloadSections(IndexSet.init(integer: section), with: UITableViewRowAnimation.none)
////                }
////                
////                self.navigationController?.pushViewController(Vc, animated: true)
////            }
////            
////        }
//        
//    }
//}


extension ConfirmOrderVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
//        let sectionItem = pushVaule?.arrayToPush[section]
//        
//        if pageSlider == 0{
//            
//            if section == 0 {
//                let viewHeader = Bundle.main.loadNibNamed("viewConfirmHeaderN", owner: nil, options: nil)?.first as? viewConfirmHeaderN
//                
//                viewHeader?.bton_address.addTarget(self, action: #selector(gotoAddressVC), for: .touchUpInside)
//                
//                viewHeader?.modelAddress = self.defaultAddress
//                
//                viewHeader?.label_storename.text = sectionItem?.stoer_name
//                
//                return viewHeader
//            }else{
//                let viewHeader = Bundle.main.loadNibNamed("viewConfirmHeaderRight", owner: nil, options: nil)?.first as? viewConfirmHeaderRight
//                
//                viewHeader?.label_storename.text = sectionItem?.stoer_name
//                
//                return viewHeader
//            }
//            
//        }else{
//            let viewHeader = Bundle.main.loadNibNamed("viewConfirmHeaderRight", owner: nil, options: nil)?.first as? viewConfirmHeaderRight
//            
//            viewHeader?.label_storename.text = sectionItem?.stoer_name
//            
//            return viewHeader
//        }
        
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        
        let viewHeader = Bundle.main.loadNibNamed("viewConfirmFooter", owner: nil, options: nil)?.first as? viewConfirmFooter
        
//        viewHeader?.section = section
//        
//        viewHeader?.pageSlider = pageSlider!
//        
//        viewHeader?.delegate = self
//        
//        viewHeader?.modelStoreItem = pushVaule?.arrayToPush[section]
        
        return viewHeader
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        if pageSlider == 0{
            
            if section == 0{
                return 130
            }else{
                return 50
            }
        }else{
            return 50
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{

        return 165
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return IBScreenWidth*72/375 + 24
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        PrintFM("\(indexPath.row)")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return (pushVaule?.arrayToPush.count ?? 0)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let sectionItem = pushVaule?.arrayToPush[section]
        
//        let arrayProducts = sectionItem?.list
//        
//        return  (arrayProducts?.count ?? 0)
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellMallCar", for: indexPath) as! TCellMallCar
        
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        
//        let sectionItem = pushVaule?.arrayToPush[indexPath.section]
//        
//        let arrayProducts = sectionItem?.list!
//        
//        cell.modelSCarItem = (arrayProducts?[indexPath.row])!
        
        return cell
        
    }
    
}
