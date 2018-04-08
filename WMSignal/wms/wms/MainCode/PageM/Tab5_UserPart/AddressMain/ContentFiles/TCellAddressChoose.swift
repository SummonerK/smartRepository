//
//  TCellAddressChoose.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/18.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class TCellAddressChoose: UITableViewCell {
    
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_phone: UILabel!
    
    @IBOutlet weak var label_address: UILabel!
    
//    var modelAddress:AddressListItemInfo?
//    {
//        didSet{
//            
//            label_name.text = modelAddress?.name
//            
//            var strDefault = ""
//            
//            if modelAddress?.is_default == 1 {
//                strDefault = ""
//            }else{
//                strDefault = "[默认地址]"
//            }
//            
//            label_phone.text = modelAddress?.mobile
//            
//            label_address.text = String.init(format: "%@%@-%@-%@-%@ %@",strDefault,modelAddress?.province ?? "",modelAddress?.city ?? "",modelAddress?.area ?? "",modelAddress?.street ?? "",modelAddress?.address ?? "")
//            
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
