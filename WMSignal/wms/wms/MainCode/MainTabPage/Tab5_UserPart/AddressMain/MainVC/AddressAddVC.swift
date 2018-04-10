//
//  AddressAddVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/30.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class AddressAddVC: UIViewController {
    
    var addressValue = (province:"",city:"",area:"",street:"",address:"")
    
    @IBOutlet weak var tf_name: UITextField!
    
    @IBOutlet weak var tf_phone: UITextField!
    
    @IBOutlet weak var label_navi: UILabel!
    
    @IBOutlet weak var label_addressArea: UILabel!
    
    @IBOutlet weak var tf_street: UITextField!
    
    @IBOutlet weak var tf_addressDetail: UITextField!
    
    @IBOutlet weak var bton_area: UIButton!
    
    @IBOutlet weak var image_default: UIImageView!
    
//    var modelAddress:AddressListItemInfo?
//    
//    // TODO: NetWork
//    let OrderM = ViewModel()
//    let disposeBag = DisposeBag()
//    //post
//    var modelAddressPush = ParamsReceivingAddressPush()           //收货地址创建Param
    
    var isDefault:Int? = 1
    {
        didSet{
            if isDefault == 1 {
                image_default.image = UIImage.init(named: "choose_n")
            }else{
                image_default.image = UIImage.init(named: "choose_s")
            }
        }
    }
    
    var _tapGesture: UITapGestureRecognizer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        KeyWindow.removeGestureRecognizer(_tapGesture)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(addressPickerView)

        _tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapRecognized(_:)))
        
        KeyWindow.addGestureRecognizer(_tapGesture)
        
//        if modelAddress != nil {
//            tf_name.text = modelAddress?.name ?? ""
//            tf_phone.text = modelAddress?.mobile ?? ""
//            label_addressArea.text = String.init(format: "%@-%@-%@", modelAddress?.province ?? "",modelAddress?.city ?? "",modelAddress?.area ?? "")
//            tf_addressDetail.text = modelAddress?.address ?? ""
//            tf_street.text = modelAddress?.street ?? ""
//            
//            isDefault = modelAddress?.is_default
//            
//            label_navi.text = "编辑收货地址"
//            
//            modelAddressPush.id = modelAddress?.id
//            
//            addressValue.province = modelAddress?.province ?? ""
//            addressValue.city = modelAddress?.city ?? ""
//            addressValue.area = modelAddress?.area ?? ""
//            addressValue.street = modelAddress?.street ?? ""
//            addressValue.address = modelAddress?.address ?? ""
//            
//        }
        
    }
    
    func createAddress(){
        
        
//        OrderM.shanShiNet_ReceivingAddressCreate(amodel: modelAddressPush)
//            .subscribe(onNext: { (posts: ModelCommonBack) in
//                
//                if let ret = posts.ret,ret == 200{
//                    HUDShowMsgQuick(msg: "添加成功", toView: self.view, time: 0.8)
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
    
    func updateAddress(){
        
//        OrderM.shanShiNet_ReceivingAddressUpdate(amodel: modelAddressPush)
//            .subscribe(onNext: { (posts: ModelCommonBack) in
//                
//                if let ret = posts.ret,ret == 200{
//                    HUDShowMsgQuick(msg: "更新成功", toView: self.view, time: 0.8)
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
    
    /** Resigning on tap gesture.   (Enhancement ID: #14)*/
    internal func tapRecognized(_ gesture: UITapGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.ended {
            
            PrintFM("close")
            closeAddress()
        }
    }
    
    @IBAction func BackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AddAction(_ sender: Any) {
        //添加地址
        
        if let name = tf_name.text,name != ""{
            
//            modelAddressPush.name = name
            
        }else{
            HUDShowMsgQuick(msg: "收货人不能为空", toView: self.view, time: 0.8)
            return
        }
        
        if let phone = tf_phone.text,phone != ""{
            
//            modelAddressPush.mobile = phone
            
        }else{
            HUDShowMsgQuick(msg: "收货人联系方式不能为空", toView: self.view, time: 0.8)
            return
        }
        
        if addressValue.province != "" {
            
        }else{
            HUDShowMsgQuick(msg: "所在区不能为空", toView: self.view, time: 0.8)
            return
        }
        
        PrintFM("")
        
        if let street = tf_street.text,street != ""{
            addressValue.street = street
            
        }else{
            HUDShowMsgQuick(msg: "街道不能为空", toView: self.view, time: 0.8)
            return
        }
        
        if let address = tf_addressDetail.text,address != ""{
            addressValue.address = address
            
        }else{
            HUDShowMsgQuick(msg: "详细地址不能为空", toView: self.view, time: 0.8)
            return
        }
        
//        modelAddressPush.province = addressValue.province
//        modelAddressPush.area = addressValue.area
//        modelAddressPush.city = addressValue.city
//        modelAddressPush.street = addressValue.street
//        modelAddressPush.address = addressValue.address
//        
//        modelAddressPush.is_default = isDefault
        
        if label_navi.text == "编辑收货地址" {
            updateAddress()
        }else{
            createAddress()
        }
    }
    
    @IBAction func addressAction(_ sender: Any) {
        PrintFM("choose Location Address")
        openAddress()
    }
    
    @IBAction func defaultAddressChoose(_ sender: Any) {
        if isDefault == 2 {
            isDefault = 1
        }else{
            isDefault = 2
        }
    }
    
    let duration: TimeInterval = 0.5
    
    func openAddress() {
        self.view.endEditing(true)
        
        UIView.animate(withDuration: duration) {
            self.addressPickerView.frame = CGRect(x: 0, y: IBScreenHeight - 220, width: IBScreenWidth, height: 220)
            self.view.layoutIfNeeded()
        }
        
    }
    
    func closeAddress() {
        UIView.animate(withDuration: duration) {
            self.addressPickerView.frame = CGRect(x: 0, y: IBScreenHeight, width: IBScreenWidth, height: 220)
            self.view.layoutIfNeeded()
        }
        
    }
    
    lazy var addressPickerView: AddressCityPickerView = {
        let view = AddressCityPickerView(frame: CGRect(x: 0, y: IBScreenHeight+44, width: IBScreenWidth, height: 220))
        view.delegate = self
        return view
    }()
    
    private lazy var ypbinputAccessoryView: YPBInputAccessoryView = {
        let inputAccessoryView = YPBInputAccessoryView(frame: CGRect(x: 0, y: IBScreenHeight, width: IBScreenWidth, height: 44))
        inputAccessoryView.cancleBtn.addTarget(self, action: #selector(didClickEndEditing(_:)), for: UIControlEvents.touchUpInside)
        inputAccessoryView.doneBtn.addTarget(self, action: #selector(didClickEndEditing(_:)), for: UIControlEvents.touchUpInside)
        return inputAccessoryView
    }()
    
    @objc private func didClickEndEditing(_ sender: Any) {
        PrintFM("end Editing")
        closeAddress()
//        addressPickerView.frame = CGRect(x: 0, y: IBScreenHeight+44, width: IBScreenWidth, height: 220)
//        ypbinputAccessoryView.frame = CGRect(x: 0, y: IBScreenHeight, width: IBScreenWidth, height: 44)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AddressAddVC: AddressCityPickerViewDelegate {
    
    func addressCityPickerView(view: AddressCityPickerView, cityDidChange province: String, city: String, area: String) {
        
        label_addressArea.text = province + "-" + city + "-" + area
        
        addressValue.province = province
        addressValue.city = city
        addressValue.area = area
        
    }
    
}

extension AddressAddVC:UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        closeAddress()
        
        return true
    }
    
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
        
        return true
        
    }
    
    
}
