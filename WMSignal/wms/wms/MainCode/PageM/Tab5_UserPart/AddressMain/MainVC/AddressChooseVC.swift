//
//  AddressChooseVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/18.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import DZNEmptyDataSet

//typealias AddressBack = (_ back:AddressListItemInfo) -> Void

class AddressChooseVC: UIViewController {
    
    //layoutView
    @IBOutlet weak var tableV_main: UITableView!
    
//    // TODO: NetWork
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    //post
//    var modelAddressList = ParamsReceivingAddressList()           //收货地址列表Param
//    var modelAddressPush = ParamsReceivingAddressPush()           //收货地址创建ParamParamsReceivingAddressDelete
//    var modelAddressDelete = ParamsReceivingAddressDelete()           //收货地址删除
//    //Data
//    var arrayAddressList:[AddressListItemInfo]?              ///收货地址列表
//
//    var addressB:AddressBack! = nil
//    
//    var choosedAddress:Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        if !choosedAddress{
//            addressB(AddressListItemInfo())
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableV_main.register(UINib.init(nibName: "TCellAddressChoose", bundle: nil), forCellReuseIdentifier: "TCellAddressChoose")
        
//        LoadTicketListData()
        
        
        // Do any additional setup after loading the view.
    }
//    
//    func LoadTicketListData(){
//        
//        
//        OrderM.shanShiNet_ReceivingAddressList(amodel: modelAddressList)
//            .subscribe(onNext: { (posts: modelAddressListBack) in
//                if let data = posts.data,let list = data.list{
//                    self.arrayAddressList = list
//                    
//                    self.tableV_main.reloadData()
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
//    }
    
    @IBAction func BackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editAction(_ sender: Any) {
        //收货地址
//        let Vc = StoryBoard_UserCenter.instantiateViewController(withIdentifier: "AddressListVC") as! AddressListVC
//        
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

extension AddressChooseVC:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellAddressChoose", for: indexPath) as! TCellAddressChoose
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
//        cell.modelAddress = arrayAddressList?[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        PrintFM("\(indexPath.row)")
//        
//        addressB((arrayAddressList?[indexPath.row])!)
//        
//        choosedAddress = true
//        
//        self.navigationController?.popViewController(animated: true)
        
    }
    
}


extension AddressChooseVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
