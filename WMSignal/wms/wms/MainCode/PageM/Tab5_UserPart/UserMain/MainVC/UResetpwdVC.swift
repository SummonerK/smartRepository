//
//  ResetpwdVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/14.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class UResetpwdVC: UIViewController {
    
    @IBOutlet weak var tf_fistPwd: UITextField!
    
    @IBOutlet weak var tf_againPwd: UITextField!
    
    //network
//    let disposeBag = DisposeBag()
//    let VM = ViewModel()
//    let model_CPwd = ParamsUserChangePWD()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func sendAction(_ sender: Any) {
        
        if let strP = tf_fistPwd.text ,strP != ""{
            
//            model_CPwd.old_password = strP
            
        }else{
            HUDShowMsgQuick(msg: "原密码输入不合法", toView: KeyWindow, time: 0.8)
            
            return
        }
        
        if let strP = tf_againPwd.text ,strP.isPwd{

//            model_CPwd.password = strP
//            model_CPwd.confirm_password = strP
            
        }else{
            HUDShowMsgQuick(msg: "建议新密码为6-20位字母和数字", toView: KeyWindow, time: 0.8)
            
            return
        }
        
//        VM.shanShiNet_UserChangePWD(amodel: model_CPwd)
//            .subscribe(onNext: { (common:ModelCommonBack) in
//                
//                self.navigationController?.popViewController(animated: true)
//                
//            },onError:{error in
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: KeyWindow, time: 0.8)
//                    
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: KeyWindow, time: 0.8)
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
