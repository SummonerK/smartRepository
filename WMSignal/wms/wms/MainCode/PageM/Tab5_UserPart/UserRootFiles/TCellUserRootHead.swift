//
//  TCellUserRootHead.swift
//  wms
//
//  Created by Luofei on 2018/4/8.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class TCellUserRootHead: UITableViewCell {

    @IBOutlet weak var imageV_head: UIImageView!
    @IBOutlet weak var label_vip: UILabel!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_safelevel: UILabel!
    @IBOutlet weak var view_safeProgress: UIView!
    
    var delegateUser:UserPart1Delegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageV_head.image = UIImage.init(named: "iv_user_head_03")
        
        setRadiusFor(toview: view_safeProgress, radius: 3, lineWidth: 0, lineColor: .clear)
        setRadiusFor(toview: imageV_head, radius: 50, lineWidth: 0, lineColor: .clear)
        setRadiusFor(toview: label_vip, radius: 9, lineWidth: 0, lineColor: .clear)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionDingdan(_ sender: Any) {
        delegateUser?.setUserPart1Action(actionType: 0)
    }
    
    @IBAction func actionFuwu(_ sender: Any) {
        delegateUser?.setUserPart1Action(actionType: 1)
    }
    
    @IBAction func actionCaigou(_ sender: Any) {
        delegateUser?.setUserPart1Action(actionType: 2)
    }
    
    @IBAction func actionPeitao(_ sender: Any) {
        delegateUser?.setUserPart1Action(actionType: 3)
    }
    
    @IBAction func actionFangyuan(_ sender: Any) {
        delegateUser?.setUserPart1Action(actionType: 4)
    }
    
}
