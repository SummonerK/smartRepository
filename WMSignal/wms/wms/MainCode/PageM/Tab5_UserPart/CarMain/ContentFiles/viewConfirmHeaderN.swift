//
//  viewConfirmHeaderN.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/13.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class viewConfirmHeaderN: UIView {
    
    @IBOutlet weak var label_storename: UILabel!
    
    @IBOutlet weak var label_postname: UILabel!
    @IBOutlet weak var label_postAddress: UILabel!
    @IBOutlet weak var label_phone: UILabel!
    
    @IBOutlet weak var bton_address: UIButton!
    @IBOutlet weak var bton_store: UIButton!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    var modelAddress:AddressListItemInfo?
//    {
//        didSet{
//            
//            label_postname.text = modelAddress?.name
//            
//            label_phone.text = modelAddress?.mobile
//            
//            label_postAddress.text = String.init(format: "%@-%@-%@-%@ %@", modelAddress?.province ?? "",modelAddress?.city ?? "",modelAddress?.area ?? "",modelAddress?.street ?? "",modelAddress?.address ?? "")
//            
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
