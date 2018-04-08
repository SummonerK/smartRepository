//
//  viewConfirmFooter.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/13.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class viewConfirmFooter: UIView {

    @IBOutlet weak var label_post: UILabel!
    @IBOutlet weak var label_quan: UILabel!
    @IBOutlet weak var label_count: UILabel!
    @IBOutlet weak var label_postPrice: UILabel!
    @IBOutlet weak var label_totalFee: UILabel!
    
    @IBOutlet weak var tf_content: UITextField!
    @IBOutlet weak var bton_postStyle: UIButton!
    @IBOutlet weak var bton_quanChoose: UIButton!
    
    var delegate:orderConfirmDelegate!
    
    var pageSlider:Int!
    
    var section:Int!
    
    var modelStoreItem:String?{
        
//        didSet{
//            
//            var useFee = (modelStoreItem?.shopTotalPrice ?? 0)
//            
//            var postFee = 0
//            
//            if pageSlider == 1 {
//                label_post.text = "到店自提"
//                
//                postFee = 0
//                
//            }else{
//                
//                if modelStoreItem?.shop_freight_config?.freight == 1{
//                    
//                    if useFee >= (modelStoreItem?.shop_freight_config?.free_shipping_price ?? 0){
//                        label_post.text = String.init(format: "满%.2f包邮", Float(modelStoreItem?.shop_freight_config?.free_shipping_price ?? 0)/100)
//                        
//                        postFee = 0
//                        
//                    }else{
//                        label_post.text = "运费¥ " + String.init(format: "%d", (modelStoreItem?.postFee ?? 0)).fixPrice()
//                        
//                        postFee = (modelStoreItem?.postFee ?? 0)
//                    }
//                    
//                }else if modelStoreItem?.shop_freight_config?.freight == 2{
//            
//                    label_post.text = "快递 免邮"
//                    
//                }
//                
//            }
//            
//            
//            if let defaultTicket = modelStoreItem?.defaultTicket {
//                
////                PrintFM("\(defaultTicket.toJSON())")
//                
//                if let finalValue = defaultTicket.end_val,let startValue = defaultTicket.start_val {
//                    
////                    PrintFM("finalValue = \(finalValue),startValue = \(startValue)")
//                    
//                    let final = Int(finalValue * 100)
//                    
//                    //满减券
//                    if defaultTicket.type == 1,useFee >= Int(startValue*100){
//                        useFee = useFee - Int(finalValue*100)
////                        useFee = useFee*final/100
//                        label_quan.text = defaultTicket.name ?? ""
//                    }else if defaultTicket.type == 2,useFee >= Int(startValue*100){     //折扣券
////                        useFee = useFee -  Int(Float(useFee)*(1-finalValue))
//                        useFee = useFee*final/100
//                        label_quan.text = defaultTicket.name ?? ""
//                    }else{
//                        label_quan.text = "当前优惠券不可用"
//                    }
//                }
//                
//            }else{
//                label_quan.text = "优惠券"
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
//            label_totalFee.text = "小计：¥ " + String.init(format: "%d", totalFee).fixPrice()
//            
//            var num = 0
//            
//            for item:ScarProdutItem in (modelStoreItem?.list)! {
//                num = num + item.number!
//            }
//            
//            label_count.text = String.init(format: "共%d件商品", num)
//            
//            tf_content.text = modelStoreItem?.content
//        }
        
        didSet{
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bton_postStyle.isEnabled = false
        
    }
    
    @IBAction func postStyleAction(_ sender: Any) {
        self.delegate.setConfirmAction(section: section, actionType: .postStyle)
    }
    
    @IBAction func ticketChooseAction(_ sender: Any) {
        self.delegate.setConfirmAction(section: section, actionType: .ticketChoose)
    }

}

extension viewConfirmFooter:UITextFieldDelegate{
    
    
    func textFieldDidEndEditing(_ textField: UITextField){
        
//        modelStoreItem?.content = textField.text
    }
    
}
