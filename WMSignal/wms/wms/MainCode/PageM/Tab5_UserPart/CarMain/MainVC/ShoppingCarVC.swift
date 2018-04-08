//
//  ShoppingCarVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/20.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import SnapKit
import RxSwift
import ObjectMapper
import SwiftyJSON

import MJRefresh

class ShoppingCarVC: UIViewController,ShoppingCarHeaderDelegate,TCellMallCarDelegate {
    
    @IBOutlet weak var table_main: UITableView!
    
    var pageDateControl:(page:Int,moreDate:Bool) = (1,true)
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    //    下拉刷新
    let header = MJRefreshNormalHeader()
//    let header = MJRefreshGifHeader()
    
    @IBOutlet weak var label_totalprice: UILabel!
    
    @IBOutlet weak var bton_allchoose: UIButton!
    
    @IBOutlet weak var bton_colorful: UIButton!
    
    var viewhader:UIView! = nil
    
    let DicSectionChoose = NSMutableDictionary()///记录各个店铺全选情况
    var flagAllChoose = false    ///记录所有店全选情况
    
    var arrayToPush = NSMutableArray() ///把购物车选择内容摘选-用于提交订单页面
    
    var arrayCarList:[String]?{
        didSet{
            
            resetAllChooseData()
            
            table_main.reloadData()
        }
    }
    
    var TotalPrice:Int = 0{
        willSet{
            
        }
        didSet{
            let str = String(describing: TotalPrice)
            label_totalprice.text = String.init("¥ \(String(describing: str.fixPrice()))")
        }
    }
    
    var tableEmpty:Bool = false{
        
        willSet{
            
        }
        didSet{
            if tableEmpty == true {
                self.view.bringSubview(toFront: viewhader)
            }else{
                self.view.sendSubview(toBack: viewhader)
            }
        }
    }
    
//    //post
//    var modelCarList = ParamsSCarList()           //购物车列表参数
//    //output
////    var modelOrderBack = ModelOrderCreateBackItem()   //oid 提交下层支付使用
//    
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        if USERM.MemberToken != "" {
            
            loadScarList()
        }
        
        bton_allchoose.isSelected = false
        flagAllChoose = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bton_colorful.gradientLayer(Width: IBScreenWidth*0.34)
        
        bton_allchoose.setImage(UIImage.init(named: "choose_s"), for: .selected)
        
        setNavi()
        
        table_main.register(UINib.init(nibName: "TCellMallCar", bundle: nil), forCellReuseIdentifier: "TCellMallCar")
        
        table_main.separatorStyle = .none
        
//        loadScarList()
        
        setIBLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setIBLoad(){
        //下拉刷新
        
//        table_main.mj_header = VSRefreshGifHeader.init{
//            self.loadScarList()
//        }
        
//        let gif = UIImage.gifImageArray(data: HUDGIFData as NSData)
//        let defaultImage = BundlePngWithName("loading0")
//        header.setImages(gif, duration: 5, for: MJRefreshState.refreshing)
//        header.setImages([defaultImage!], for: MJRefreshState.pulling)
//        header.setImages([defaultImage!], for: MJRefreshState.idle)
//        header.stateLabel.isHidden = true
//        header.lastUpdatedTimeLabel.isHidden = true
//        header.gifView.contentMode = .scaleAspectFit
//        header.gifView.clipsToBounds = true
        
        header.setRefreshingTarget(self, refreshingAction: #selector(loadScarList))
        table_main.mj_header = header
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavi() {
        
        viewhader = Bundle.main.loadNibNamed("viewMallHolder", owner: nil, options: nil)?.first as? viewMallHolder
        
//        viewhader.backgroundColor = AnyColor(alpha: 0.6)
        
        self.view.addSubview(viewhader!)
        
        viewhader?.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.width)
        })
        
        self.view.sendSubview(toBack: viewhader!)
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionEdit(_ sender: Any) {
        table_main.setEditing(true, animated: true)
    }
    
    @IBAction func actionAllChoose(_ sender: Any) {
        
        if bton_allchoose.isSelected {
            bton_allchoose.isSelected = false
            flagAllChoose = false
        }else{
            bton_allchoose.isSelected = true
            flagAllChoose = true
        }
        
        resetAllChooseData()
        
    }
    
    func resetAllChooseData(){
        
//        for i in 0..<(arrayCarList?.count ?? 0) {
//            let storeItem = arrayCarList?[i]
//            
//            DicSectionChoose.setValue(flagAllChoose, forKey: "section\(i)")
//            
//            if let plist = storeItem?.list{
//                
//                for item in plist {
//                    item.chooseFlag = flagAllChoose
//                }
//            }
//            
//        }
//        
//        self.table_main.reloadData()
//        
//        restBottomAllChoose()
//        
//        fixTotalPrice()
    }
    
    func restBottomAllChoose(){
        
        let array = DicSectionChoose.allValues as! [Bool]
        
        PrintFM("\(array)")
        
        let filterArrays = array.filterDuplicates({$0})
        
        PrintFM("\(filterArrays)")
        
        if filterArrays.count == 1 {
            bton_allchoose.isSelected = filterArrays[0]
            flagAllChoose = filterArrays[0]
        }else{
            bton_allchoose.isSelected = false
            flagAllChoose = false
        }
        
        fixTotalPrice()
    }
    
    func fixTotalPrice(){
        
        var totalPrice:Int = 0
        
        ///清空订单表
        arrayToPush.removeAllObjects()
        
        for i in 0..<(arrayCarList?.count ?? 0) {
            
            let storeItem = arrayCarList?[i]
            
            let list = NSMutableArray()  ///选中的 商品列表
            
//            for item in storeItem?.list ?? [] {
//                if item.chooseFlag == true{
//                    totalPrice = totalPrice + (item.goods_price! * item.number!)
//                    list.add(item)
//                }else{
//                    continue
//                }
//            }
//            
//            let orderStore = ScarListItem()
//            orderStore.stoer_name = storeItem?.stoer_name
//            orderStore.store_id = storeItem?.store_id
//            orderStore.shop_freight_config = storeItem?.shop_freight_config
//            orderStore.user_ticket = storeItem?.user_ticket
//            if list.count > 0{
//                orderStore.list = list as? [ScarProdutItem]
//                arrayToPush.add(orderStore)
//            }
            
            
        }
        
        TotalPrice = totalPrice
        
    }
    
    func loadScarList() {
//        OrderM.shanShiNet_SCarList(amodel: modelCarList)
//            .subscribe(onNext: { (posts: modelSCarListBack) in
//                if let data = posts.data,let list = data.list{
//                    
//                    self.table_main.mj_header.endRefreshing()
//                    
//                    self.arrayCarList = list
//                }
//                
//            },onError:{error in
//                
//                self.table_main.mj_header.endRefreshing()
//                
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
//                    
//                }
//            })
//            .addDisposableTo(disposeBag)
    }
    
    //MARK:前往支付
    @IBAction func action_PayNow(_ sender: Any) {
        
//        if arrayToPush.count > 0{
//            
//            let VC = ConfirmOrderVC(nibName: "ConfirmOrderVC", bundle: nil)
//            
//            VC.pushVaule = (1,self.arrayToPush as? [ScarListItem]) as? (page: Int, arrayToPush: [ScarListItem])
//            
//            self.navigationController?.pushViewController(VC, animated: true)
//            
//        }else{
//            
//            HUDShowMsgQuick(msg: "请至少选择一个商品进行结算", toView: self.view, time: 0.8)
//        }

    }
 
 
    
}

extension ShoppingCarVC:UITableViewDataSource{
    
    //    店铺选择处理
    func setChooseValue(section:Int,sectionFlag:Bool){
        
//        DicSectionChoose.setValue(sectionFlag, forKey: "section\(section)")
//        
//        //所有店铺内商品  优先级低于 店铺选择
//        let storeItem = arrayCarList?[section]
//        for item in storeItem?.list ?? [] {
//            item.chooseFlag = sectionFlag
//        }
//        
//        restBottomAllChoose()
//        
//        self.table_main.reloadData()
        
    }
    
    func setAction(indexpath:IndexPath,actionType:IBGoodsCoverActionType){
        
//        let sectionItem = arrayCarList?[indexpath.section]
//        
//        let arrayProducts = sectionItem?.list!
//        
//        let modelScarItem = (arrayProducts?[indexpath.row])!
//        
//        let modelGoodsEidt = ParamsSCarUpDateCount()
//        
//        modelGoodsEidt.goods_id = modelScarItem.goods_id
//        modelGoodsEidt.goods_sku = modelScarItem.goods_sku
//        
//        var count:Int = 0
//        
//        switch actionType {
//        case .ADD:
//            PrintFM("")
//            count = modelScarItem.number! + 1
//        case .Fls:
//            PrintFM("")
//            count = modelScarItem.number! - 1
//        default:
//            PrintFM("")
//        }
//        
//        modelGoodsEidt.number = count.description
//        
//        self.OrderM.shanShiNet_SCarUpDateCount(amodel: modelGoodsEidt)
//            .subscribe(onNext: {(posts:SCarUpDateCountBack) in
//                
//                if let ret = posts.ret{
//                    
//                    let stock = posts.data?.stock ?? 1
//                    
//                    if ret == 200{
//                        
//                        modelScarItem.number = count
//                        
//                        self.table_main.reloadRows(at: [indexpath], with: UITableViewRowAnimation.none)
//                        
//                        self.fixTotalPrice()
//                    }
//                    
//                    if ret == 300010{
//                        
//                        if count >= stock{
//                            
//                            modelScarItem.number = stock
//                            
//                        }else{
//                            
//                            // ???
//                        }
//                        
//                        self.table_main.reloadRows(at: [indexpath], with: UITableViewRowAnimation.none)
//                        
//                        self.fixTotalPrice()
//                    }
//                    
//                }
//                
//            },onError:{error in
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                            HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//                self.table_main.reloadRows(at: [indexpath], with: UITableViewRowAnimation.none)
//            })
//            .addDisposableTo(self.disposeBag)
        
    }
    
    //    商品选择处理
    func setChooseValue(indexpath:IndexPath,cellFlag:Bool){
        
//        //所有店铺内商品  优先级低于 店铺选择
//        let storeItem = arrayCarList?[indexpath.section]
//        
//        if let array = storeItem?.list{
//            
//            array[indexpath.row].chooseFlag = cellFlag
//            
//            let filterArrays = array.filterDuplicates({$0.chooseFlag!})
//            
//            if filterArrays.count == 1 {
//                DicSectionChoose.setValue(filterArrays[0].chooseFlag, forKey: "section\(indexpath.section)")
//            }else{
//                DicSectionChoose.setValue(false, forKey: "section\(indexpath.section)")
//            }
//            
//        }
//        
//        restBottomAllChoose()
//        
//        self.table_main.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
//        let viewheader = Bundle.main.loadNibNamed("ViewMallCarHeader", owner: nil, options: nil)?.first as? ViewMallCarHeader
//        
//        viewheader?.delegate = self
//        
//        viewheader?.section = section
//        
//        let sectionItem = arrayCarList?[section]
//        
//        viewheader?.label_name.text = sectionItem?.stoer_name
//        
//        viewheader?.bton_choose.isSelected = DicSectionChoose.value(forKey: "section\(section)") as! Bool
//        
//        return viewheader
        
        return nil
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let count = (arrayCarList?.count ?? 0)
        
        tableEmpty = (count == 0)
        
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionItem = arrayCarList?[section]
        
//        let arrayProducts = sectionItem?.list
        
//        return  (arrayProducts?.count ?? 0)
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellMallCar", for: indexPath) as! TCellMallCar
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
//        cell.delegate = self
//        
//        cell.indexpath = indexPath
//        
//        let sectionItem = arrayCarList?[indexPath.section]
//        
//        let arrayProducts = sectionItem?.list!
//        
//        cell.modelSCarItem = (arrayProducts?[indexPath.row])!
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
//        let sectionItem = arrayCarList?[indexPath.section]
//        
//        let arrayProducts = sectionItem?.list!
//        
//        let modelScarItem = (arrayProducts?[indexPath.row])!
//        
//        let modelDelete = ParamsSCarDelete()
//        
//        modelDelete.goods_id = modelScarItem.goods_id?.description
//        
//        if editingStyle == .delete {
//            
//            let alert = UIAlertController(title: "提示", message: "删除数据将不可恢复", preferredStyle: .alert)
//            
//            let calcelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            let deleteAction = UIAlertAction(title: "删除", style: .default, handler: { (UIAlertAction) in
//                
//                self.OrderM.shanShiNet_SCarDelete(amodel: modelDelete)
//                    .subscribe(onNext: {(posts:ModelCommonBack) in
//                        
//                        if let ret = posts.ret,ret == 200{
//                            HUDShowMsgQuick(msg: "删除成功", toView: self.view, time: 0.8)
//                            
//                            self.loadScarList()
//                            
//                        }
//                        
//                    },onError:{error in
//                        if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                            HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                        }else{
////                            HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                        }
//                        
//                    })
//                    .addDisposableTo(self.disposeBag)
//                
//            })
//            
//            // 添加
//            alert.addAction(calcelAction)
//            alert.addAction(deleteAction)
//            
//            // 弹出
//            self.present(alert, animated: true, completion: nil)
//            
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
        
    }
    
}


extension ShoppingCarVC: UITableViewDelegate {
    
    func productDelete(indexPath:IndexPath) {
        
        self.fixTotalPrice()
        HUDShowMsgQuick(msg: "删除成功", toView: self.view, time: 0.8)
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return 56
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sectionItem = arrayCarList?[indexPath.section]
        
//        let arrayProducts = sectionItem?.list!
//        
//        let NVC = StoryBoard_FeaturedTop.instantiateViewController(withIdentifier: "GoodsDetailVC") as! GoodsDetailVC
//        
//        NVC.GoodsId = arrayProducts?[indexPath.row].id?.description
//        
//        self.navigationController?.pushViewController(NVC, animated: true)
        
    }
}
