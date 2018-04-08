//
//  RegisterVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/21.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class RegisterVC: UIViewController,UITextFieldDelegate {
    
    //network
//    let disposeBag = DisposeBag()
//    let VM = ViewModel()
//    let model = ParamsUserRegisterSMS()
//    let modelregest = ParamsUserRegister()
    
    @IBOutlet weak var bton_regist: UIButton!
    @IBOutlet weak var bton_vCode: UIButton!
    
    @IBOutlet weak var tf_phone: UITextField!
    
    @IBOutlet weak var tf_vCode: UITextField!
    
    @IBOutlet weak var tf_pwd: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bton_regist.gradientLayer(Width: IBScreenWidth*0.9)
        
        setRadiusFor(toview: bton_regist, radius: 22, lineWidth: 0, lineColor: .clear)
        setRadiusFor(toview: bton_vCode, radius: 5, lineWidth: 0, lineColor: .clear)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func RegisterAction(_ sender: Any) {
        
        if let str = tf_phone.text , str.isFullTelNumber(){
//            modelregest.mobile = str
        }else{
            HUDShowMsgQuick(msg: "手机号不合法", toView: KeyWindow, time: 0.8)
            return
        }
        
        if let str = tf_vCode.text , str != ""{
//            modelregest.code = str
        }else{
            HUDShowMsgQuick(msg: "验证码不能为空", toView: KeyWindow, time: 0.8)
            return
        }
        
        if let strP = tf_pwd.text ,strP.isPwd{
            
//            HUDShowMsgQuick(msg: "密码合法", toView: KeyWindow, time: 0.8)
            
            bton_vCode.isEnabled = false
            
//            modelregest.password = strP
            
//            VM.shanShiNet_UserRegister(amodel: modelregest)
//                .subscribe(onNext: { (common:userLoginBack) in
//                    
//                    if let data = common.data,let token = data.token{
////                        USERM.setMemberTOKEN(uid: token)
//                        
//                        print("\(token)")
//                    }
//                    USERM.setPhone(phone: self.model.mobile)
//                    
//                    self.navigationController?.popToRootViewController(animated: true)
//                    
//                },onError:{error in
//                    if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                        HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                    }else{
////                        HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                    }
//                })
//                .addDisposableTo(disposeBag)
        }else{
            HUDShowMsgQuick(msg: "建议密码为6-20位字母和数字", toView: KeyWindow, time: 0.8)
        }
 
        
    }
    
    @IBAction func getVCodeAction(_ sender: Any) {
        
        if let str = tf_phone.text , str.isFullTelNumber(){
            
            bton_vCode.isEnabled = false
            
//            model.mobile = str
//            
//            VM.shanShiNet_UserRegisterSMS(amodel: model)
//                .subscribe(onNext: { (common:ModelCommonBack) in
//                    
////                    HUDShowMsgQuick(msg: common.msg!, toView: KeyWindow, time: 0.8)
//                    self.setRunTimer()
//                    
//                },onError:{error in
//                    if let msg = (error as? MyErrorEnum)?.drawMsgValue{
//                        HUDShowMsgQuick(msg: msg, toView: self.view, time: 0.8)
//                    }else{
//                        HUDShowMsgQuick(msg: "server error", toView: self.view, time: 0.8)
//                    }
//                })
//                .addDisposableTo(disposeBag)
        }else{
            HUDShowMsgQuick(msg: "手机号不合法", toView: KeyWindow, time: 0.8)
        }
        
    }
    
    var rtcount: TimeInterval = 60
    var rtimer:Timer?
    
    func setRunTimer(){
        bton_vCode.isEnabled = false
        bton_vCode.backgroundColor = FlatLightWhiteF1
//        bton_vCode.setTitleColor(UIColor.white, for: UIControlState.disabled)
        
        if rtimer != nil {
            rtcount = 60
        }else{
            rtimer = Timer.init(fireAt: NSDate() as Date, interval: 1.0, target: self, selector: #selector(rtpick), userInfo: nil, repeats: true)
            
            RunLoop.current.add(rtimer!, forMode:RunLoopMode.commonModes)
        }
    }
    
    func rtpick() {
        PrintFM("\(rtcount)")
        
        if rtcount<=0 {
            rtimer?.invalidate()
            rtimer = nil
            bton_vCode.setTitle("重新发送", for: UIControlState.normal)
            bton_vCode.backgroundColor = UIColor.white
            rtcount = 60
            bton_vCode.isEnabled = true
        }else{
            bton_vCode.titleLabel?.text = "\(Int(rtcount))s"
            bton_vCode.setTitle("\(Int(rtcount))s", for: UIControlState.disabled)
            rtcount -= 1
        }
        
    }
    
    //MARK:-TextFieldDelegate 输入判断
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if textField == tf_phone , let str = textField.text{
            
            let strLength = str.length - range.length  + string.length
            
            if strLength > 11 {
                return false
            }else if strLength==4 || strLength==5{
                
                PrintFM("\(String(describing: str)) is \(str.isTelNumber())")
                
                return str.isTelNumber()
            }
            
        }
        
        if textField == tf_pwd , let str = textField.text{
            
            let strLength = str.length - range.length  + string.length
            
            if strLength > 20{
                return false
            }
        }
        
        return true
        
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
