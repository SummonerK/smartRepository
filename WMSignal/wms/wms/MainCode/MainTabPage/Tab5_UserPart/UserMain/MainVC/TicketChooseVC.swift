//
//  TicketChooseVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/22.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import DZNEmptyDataSet

//typealias TicketBack = (_ back:TicketListItemInfo?) -> Void

class TicketChooseVC: UIViewController {
    
    @IBOutlet weak var tableViewMain:UITableView!
    
//    var useValue:(storeId:String,totalFee:Int)?
//    
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    //post
//    var modelTicketList = ParamsUserTickets()           //优惠券列表Param
//    //Data
//    var arrayTicketList:[TicketListItemInfo]?            ///优惠券列表
//
//    var ticketB:TicketBack? = nil
//    
//    var choosedTicket:TicketListItemInfo?
//    
//    var choosedAddress:Bool = false
//    
//    var chooseIndexPath:IndexPath?
//    {
//        didSet{
//            
////            if chooseIndexPath != nil{
////                ticketB((arrayTicketList?[chooseIndexPath!.row])!)
////                choosedAddress = true
////            }else{
////                ticketB(nil)
////                choosedAddress = false
////            }
//            
//            if chooseIndexPath != nil{
//                choosedTicket = arrayTicketList?[chooseIndexPath!.row]
//                choosedAddress = true
//            }else{
//                choosedTicket = nil
//                choosedAddress = false
//            }
//            
//            ticketB!(choosedTicket)
//            
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        
//        if !choosedAddress{
//            ticketB(TicketListItemInfo())
//        }
//        
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableViewMain.register(UINib.init(nibName: "TCellQuan", bundle: nil), forCellReuseIdentifier: "TCellQuan")
        
//        LoadUnusedTicketList()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func LoadUnusedTicketList(){
//
//        modelTicketList.status = 1
//        modelTicketList.store_id = useValue?.storeId
//        
//        OrderM.shanShiNet_UserTickets(amodel: modelTicketList)
//            .subscribe(onNext: { (posts: modelTicketListBack) in
//                if let data = posts.data,let list = data.list{
//                    self.arrayTicketList = list
//                    self.tableViewMain.reloadData()
//                }
//            },onError:{error in
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
//    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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

extension TicketChooseVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellQuan", for: indexPath) as! TCellQuan
        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        
//        cell.imageV_mark.isHidden = true
//        cell.view_left.backgroundColor = FlatYellowShine
//        cell.view_right.backgroundColor = FlatPinkLight
//        
////        if chooseIndexPath == indexPath{
////            arrayTicketList?[indexPath.row].choosed = true
////        }else{
////            arrayTicketList?[indexPath.row].choosed = false
////        }
//        
//        if choosedTicket?.id == arrayTicketList?[indexPath.row].id {
//            
//            arrayTicketList?[indexPath.row].choosed = true
//            
//            chooseIndexPath = indexPath
//            
//        }else{
//            arrayTicketList?[indexPath.row].choosed = false
//        }
//        
//        cell.modelTicket = arrayTicketList?[indexPath.row]
        
        return cell
        
    }
    
}

extension TicketChooseVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return (IBScreenWidth - 24)*120/350 + 12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        for item:TicketListItemInfo in arrayTicketList! {
//            item.choosed = false
//        }
//        
//        arrayTicketList?[indexPath.row].choosed = true
//        self.tableViewMain.reloadData()
//        chooseIndexPath = indexPath
        
//        if chooseIndexPath == indexPath{
//            chooseIndexPath = nil
//        }else{
//            chooseIndexPath = indexPath
//        }
//        
//        self.tableViewMain.reloadData()
        
    }
}


extension TicketChooseVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat{
        return 0
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString!{
        
        let text = "没有可用优惠券"
        let attrs = [NSFontAttributeName: IBFontWithSize(14),NSForegroundColorAttributeName: FlatGray66]
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    //Add your image
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "empty_quan")
    }
    
}
