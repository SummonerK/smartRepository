//
//  AddressListVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/30.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import MJRefresh
import DZNEmptyDataSet

class AddressListVC: UIViewController {

    //layoutView
    @IBOutlet weak var tableV_main: UITableView!
    
    var pageDateControl:(page:Int,moreDate:Bool) = (1,true)
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    //    下拉刷新
    let header = MJRefreshNormalHeader()
    
    @IBOutlet weak var bton_colorful: UIButton!
    
    // TODO: NetWork
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    //post
//    var modelAddressList = ParamsReceivingAddressList()           //收货地址列表Param
//    var modelAddressPush = ParamsReceivingAddressPush()           //收货地址创建ParamParamsReceivingAddressDelete
//    var modelAddressDelete = ParamsReceivingAddressDelete()           //收货地址删除
//    //Data
//    var arrayAddressList:[AddressListItemInfo]?              ///收货地址列表
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        if USERM.MemberToken != ""{
            
            LoadTicketListData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bton_colorful.gradientLayer(Width: IBScreenWidth)
        
        tableV_main.register(UINib.init(nibName: "TCellAddress", bundle: nil), forCellReuseIdentifier: "TCellAddress")

        setIBLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setIBLoad(){
        //下拉刷新
        
        header.setRefreshingTarget(self, refreshingAction: #selector(LoadTicketListData))
        tableV_main.mj_header = header
    }
    
    func LoadTicketListData(){
        
        
//        OrderM.shanShiNet_ReceivingAddressList(amodel: modelAddressList)
//            .subscribe(onNext: { (posts: modelAddressListBack) in
//                if let data = posts.data,let list = data.list{
//                    self.arrayAddressList = list
//                    
//                    self.tableV_main.mj_header.endRefreshing()
//                    self.tableV_main.reloadData()
//                }
//                
//            },onError:{error in
//                
//                self.tableV_main.mj_header.endRefreshing()
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
        
        
    }

    
    @IBAction func BackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func AddAction(_ sender: Any) {
        //添加地址页面
//        let Vc = AddressAddVC(nibName: "AddressAddVC", bundle: nil)
//        self.navigationController?.pushViewController(Vc, animated: true)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddressListVC:UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return (arrayAddressList?.count ?? 0)
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        if section == 0{
            return 12
        }else{
            return 0.1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellAddress", for: indexPath) as! TCellAddress
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
//        cell.delegate = self
//        cell.addressIndex = indexPath
//        cell.modelAddress = arrayAddressList?[indexPath.row]
//        
//        if (arrayAddressList?[indexPath.row])?.is_default  == 2 {
//            cell.bton_set.isSelected = true
//        }else{
//            cell.bton_set.isSelected = false
//        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 128
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        PrintFM("\(indexPath.row)")
        
//        let Vc = AddressAddVC(nibName: "AddressAddVC", bundle: nil)
//        
//        Vc.modelAddress = arrayAddressList?[indexPath.row]
//        
//        self.navigationController?.pushViewController(Vc, animated: true)
        
    }

}

extension AddressListVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat{
        return 0
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString!{
        
        let text = "您还没有添加地址，赶快创建吧"
        let attrs = [NSFontAttributeName: IBFontWithSize(14),NSForegroundColorAttributeName: FlatGray66]
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    //Add your image
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "empty_address")
    }
    
}


extension AddressListVC: UserAddressDelegate{
    
    func setAction(indexPath:IndexPath, actionType:AddressActionType){
        
//        let itemAddress = arrayAddressList?[indexPath.row]
        
        switch actionType {
        case .SET:
            PrintFM("set\(indexPath)")
            
            
//            modelAddressPush.name = itemAddress?.name
//            modelAddressPush.id = itemAddress?.id
//            modelAddressPush.mobile = itemAddress?.mobile
//            modelAddressPush.province = itemAddress?.province
//            modelAddressPush.area = itemAddress?.area
//            modelAddressPush.city = itemAddress?.city
//            modelAddressPush.street = itemAddress?.street
//            modelAddressPush.address = itemAddress?.address
//            modelAddressPush.is_default = 2
//                
//                
//            OrderM.shanShiNet_ReceivingAddressUpdate(amodel: modelAddressPush)
//                .subscribe(onNext: { (posts: ModelCommonBack) in
//                    
//                    if let ret = posts.ret,ret == 200{
//                        
//                        HUDShowMsgQuick(msg: "设置成功", toView: self.view, time: 0.8)
//                        
//                        self.LoadTicketListData()
//
//                    }
//                    
//                },onError:{error in
//                    
//                    if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                        HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                    }else{
////                        HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                    }
//                    
//                })
//                .addDisposableTo(disposeBag)
            
        case .EDIT:
            PrintFM("edit\(indexPath)")
//            //添加地址页面
//            let Vc = AddressAddVC(nibName: "AddressAddVC", bundle: nil)
//            
//            Vc.modelAddress = arrayAddressList?[indexPath.row]
//            
//            self.navigationController?.pushViewController(Vc, animated: true)
        case .DELETE:
            
            PrintFM("edit\(indexPath)")
            
//            modelAddressDelete.id = itemAddress?.id
//            
//            let alert = UIAlertController(title: "提示", message: "删除数据将不可恢复", preferredStyle: .alert)
//            
//            let calcelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            let deleteAction = UIAlertAction(title: "删除", style: .default, handler: { (UIAlertAction) in
//            
//                self.OrderM.shanShiNet_ReceivingAddressDelete(amodel: self.modelAddressDelete)
//                    .subscribe(onNext: {(posts:ModelCommonBack) in
//                        
//                        if let ret = posts.ret,ret == 200{
//                            HUDShowMsgQuick(msg: "删除成功", toView: self.view, time: 0.8)
//                            
//                            self.LoadTicketListData()
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
            
        }
    }
}
