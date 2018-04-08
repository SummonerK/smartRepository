//
//  LoginMainVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/21.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class LoginMainVC: UIViewController {
    
    @IBOutlet weak var bton_login: UIButton!
    
    @IBOutlet weak var tf_phone: UITextField!
    
    @IBOutlet weak var tf_pwd: UITextField!
    
//    let disposeBag = DisposeBag()
//    let VM = ViewModel()
//    let model = ParamsUserLogin()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bton_login.gradientLayer(Width: IBScreenWidth*0.9)
        
        setRadiusFor(toview: bton_login, radius: 22, lineWidth: 0, lineColor: .clear)
        
        tf_phone.text = USERM.Phone
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        PrintFM("登录")
//        model.mobile = tf_phone.text
//        model.password = tf_pwd.text
        
        if let phone = tf_phone.text,phone != ""{
            
        }else{
            HUDShowMsgQuick(msg: "手机号不能为空", toView: self.view, time: 0.8)
            return
        }
        
        if let pwd = tf_pwd.text,pwd != ""{
            
        }else{
            HUDShowMsgQuick(msg: "密码不能为空", toView: self.view, time: 0.8)
            return
        }
        
//        VM.shanShiNet_UserLogin(amodel: model)
//            .subscribe(onNext: { (common:userLoginBack) in
//                
//                if let data = common.data,let token = data.token{
//                   USERM.setMemberTOKEN(token: token)
//                }
//                USERM.setPhone(phone: self.model.mobile)
//                
//                self.navigationController?.dismiss(animated: true, completion: nil)
//                
//            },onError:{error in
//                
//                if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                    HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                }else{
////                    HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                }
//                
//            })
//            .addDisposableTo(disposeBag)
    }

    @IBAction func registerAction(_ sender: Any) {
        
        //注册 - 注册页面
        
        let Vc = StoryBoard_Login.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        
        self.navigationController?.pushViewController(Vc, animated: true)
        
        
    }
    
    @IBAction func resetPwdAction(_ sender: Any) {
        
        //注册 - 重设密码页面
        
        let Vc = StoryBoard_Login.instantiateViewController(withIdentifier: "ResetpwdVC") as! ResetpwdVC
        
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
