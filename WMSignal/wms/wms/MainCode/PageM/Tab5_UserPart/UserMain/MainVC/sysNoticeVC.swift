//
//  sysNoticeVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/25.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

import MJRefresh

class sysNoticeVC: UIViewController {
    
    @IBOutlet weak var tableViewMain:UITableView!
    
    var pageDateControl:(page:Int,moreDate:Bool) = (1,true)
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    //    下拉刷新
    let header = MJRefreshNormalHeader()
    
    // TODO: NetWork
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    //post
//    var modelMsgList = ParamsIBMessageList()           //系统消息列表Param
//    //Data
//    var arrayMsgList:[modelMsgItem]?              ///系统消息列表
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.register(UINib.init(nibName: "TCellNotice", bundle: nil), forCellReuseIdentifier: "TCellNotice")
        
        setIBLoad()

        LoadMsgListData()
        
        // Do any additional setup after loading the view.
    }
    
    func setIBLoad(){
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(LoadMoreMsgListData))
        tableViewMain.mj_footer = footer
        
        //下拉刷新
        
        header.setRefreshingTarget(self, refreshingAction: #selector(LoadMsgListData))
        tableViewMain.mj_header = header
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func LoadMsgListData(){
        
//        self.tableViewMain.mj_footer.resetNoMoreData()
//        
//        pageDateControl = (1,true)
//        
//        modelMsgList.page = pageDateControl.page
//        modelMsgList.pageSize = 10
//        
//        OrderM.shanShiNet_IBMessageList(amodel: modelMsgList)
//            .subscribe(onNext: { (posts: modelMsgListBack) in
//                if let data = posts.data,let list = data.list{
//                    
//                    self.tableViewMain.mj_header.endRefreshing()
//                    
//                    self.pageDateControl.moreDate = (data.has_next_page ?? true)
//                    
//                    self.arrayMsgList = list
//                    
//                    self.tableViewMain.reloadData()
//                }
//                
//            },onError:{error in
//                
//                self.tableViewMain.mj_header.endRefreshing()
//                
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//            })
//            .addDisposableTo(disposeBag)
    }

    func LoadMoreMsgListData(){
        
        self.tableViewMain.mj_footer.resetNoMoreData()
        
        pageDateControl.page = pageDateControl.page + 1
        
//        if pageDateControl.moreDate{
//            
//        }else{
//            PrintFM("如果无数据，再次请求当前页")
//        }
        
//        modelMsgList.page = pageDateControl.page
//        modelMsgList.pageSize = 10
//        
//        OrderM.shanShiNet_IBMessageList(amodel: modelMsgList)
//            .subscribe(onNext: { (posts: modelMsgListBack) in
//                if let data = posts.data,let list = data.list{
//                    
//                    self.pageDateControl.moreDate = (data.has_next_page ?? true)
//                    
//                    if !self.pageDateControl.moreDate{
//                        self.pageDateControl.page = self.pageDateControl.page - 1
//                    }
//                    
//                    
//                    if self.pageDateControl.moreDate{
//                        self.tableViewMain.mj_footer.endRefreshing()
//                    }else{
//                        self.tableViewMain.mj_footer.endRefreshingWithNoMoreData()
//                    }
//                    
//                    let arrayTemp = NSMutableArray()
//                    
//                    arrayTemp.addObjects(from: self.arrayMsgList!)
//                    
//                    arrayTemp.addObjects(from: list)
//                    
//                    self.arrayMsgList = arrayTemp as? [modelMsgItem]
//                    
//                    self.tableViewMain.reloadData()
//                    
//                }
//                
//            },onError:{error in
//                self.tableViewMain.mj_footer.endRefreshing()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension sysNoticeVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return (arrayMsgList?.count ?? 0)
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCellNotice", for: indexPath) as! TCellNotice
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        cell.msgInfo = arrayMsgList?[indexPath.row]
        
        return cell
        
    }
    
}

extension sysNoticeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//分期详情
//
//        let Vc = StoryBoard_FoundTop.instantiateViewController(withIdentifier: "TuijianNewsVC") as! TuijianNewsVC
//
//        self.navigationController?.pushViewController(Vc, animated: true)
        
        PrintFM("")
        
    }
}
