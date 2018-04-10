//
//  TCellNotice.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/12/25.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class TCellNotice: UITableViewCell {
    
    @IBOutlet weak var imageV_icon: UIImageView!
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_msg: UILabel!
    @IBOutlet weak var label_date: UILabel!
    
//    var msgInfo:modelMsgItem?
//    {
//        didSet{
//            
//            var imageName = ""
//            
//            if msgInfo?.type  == "1"{
//                imageName = "notice_sys"
//            }else if(msgInfo?.type  == "2"){
//                imageName = "notice_orderon"
//            }else if(msgInfo?.type  == "3"){
//                imageName = "notice_post"
//            }else if(msgInfo?.type  == "4"){
//                imageName = "notice_orderReceive"
//            }else if(msgInfo?.type  == "5"){
//                imageName = "notice_activy"
//            }else{
//                imageName = "notice_sys"
//            }
//            
//            imageV_icon.image = UIImage(named: imageName)
//            
//            label_title.text = msgInfo?.title ?? ""
//            label_msg.text = msgInfo?.desc ?? ""
//            
//            if let time = msgInfo?.create_time {
//                label_date.text = time.timeSPData.string_from(formatter: "yy.M.d")
//            }
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
