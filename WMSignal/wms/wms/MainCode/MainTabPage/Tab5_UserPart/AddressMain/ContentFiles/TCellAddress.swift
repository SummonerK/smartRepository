//
//  TCellAddress.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/30.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class TCellAddress: UITableViewCell {
    
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_phone: UILabel!
    
    @IBOutlet weak var bton_set: UIButton!
    
    @IBOutlet weak var bton_edit: UIButton!
    
    @IBOutlet weak var bton_delete: UIButton!
    
    @IBOutlet weak var label_address: UILabel!
    
    var addressIndex:IndexPath? = nil
    
    var delegate:UserAddressDelegate?

    
//    var modelAddress:AddressListItemInfo?
//    {
//        didSet{
//            
//            label_name.text = modelAddress?.name
//            
//            if modelAddress?.is_default == 1 {
//                bton_set.isSelected = false
//            }else{
//                bton_set.isEnabled = true
//            }
//            
//            label_phone.text = modelAddress?.mobile
//
//            label_address.text = String.init(format: "%@-%@-%@-%@ %@", modelAddress?.province ?? "",modelAddress?.city ?? "",modelAddress?.area ?? "",modelAddress?.street ?? "",modelAddress?.address ?? "")
//            
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        bton_set.setImage(IBImageWithName("choose_s"), for: UIControlState.selected)
        bton_set.setTitle("默认地址", for: UIControlState.selected)
        
        // Initialization code
    }
    
    @IBAction func action_set(_ sender: Any) {
        self.delegate?.setAction(indexPath: addressIndex!,actionType: .SET)
    }
    
    @IBAction func action_delete(_ sender: Any) {
        self.delegate?.setAction(indexPath: addressIndex!,actionType: .DELETE)
    }
    
    @IBAction func action_edit(_ sender: Any) {
        self.delegate?.setAction(indexPath: addressIndex!,actionType: .EDIT)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
