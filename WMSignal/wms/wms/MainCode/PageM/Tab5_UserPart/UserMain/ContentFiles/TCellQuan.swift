//
//  TCellQuan.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/22.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class TCellQuan: UITableViewCell {

    @IBOutlet weak var view_content: UIView!
    @IBOutlet weak var view_right: UIView!
    @IBOutlet weak var view_left: UIView!
    
    @IBOutlet weak var imageV_mark: UIImageView!
    @IBOutlet weak var imageV_choose: UIImageView!
    
    @IBOutlet weak var label_store: UILabel!
    @IBOutlet weak var label_total: UILabel!
    @IBOutlet weak var label_postPrice: UILabel!
    @IBOutlet weak var label_postDate: UILabel!
    
//    var modelTicket:TicketListItemInfo?
//    {
//        didSet{
//            
//            if let timeStartsp = modelTicket?.expire_start_time,let timeEndsp = modelTicket?.expire_end_time{
//                label_postDate.text = timeStartsp.timeSPData.string_from(formatter: "yyyy.MM.dd") +  "_" + timeEndsp.timeSPData.string_from(formatter: "yyyy.MM.dd")
//            }
//        
//            label_store.text = "仅可供" + (modelTicket?.store_name ?? "") + "商品使用"
//            
//            if modelTicket?.type == 1 {
//                label_total.text = String.init(format: "%@", (modelTicket?.end_val ?? 0).fixTicket())
//                label_postPrice.text = String.init(format: "满%@立减%@",(modelTicket?.start_val ?? 0).fixTicket() , (modelTicket?.end_val ?? 0).fixTicket())
//            }
//            
//            if modelTicket?.type == 2{
//                label_total.text = String.init(format: "%@折", (modelTicket?.end_val ?? 0).fixZheString())
//                label_postPrice.text = "折扣优惠券"
//            }
//            
//            imageV_choose.isHidden = !(modelTicket?.choosed ?? false)
//            
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageV_choose.isHidden = true
        
//        view_left.backgroundColor = FlatCafeeLight
//        view_right.backgroundColor = FlatCafeeRegular
        
        setRadiusFor(toview: view_content, radius: 6, lineWidth: 0, lineColor: .clear)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
