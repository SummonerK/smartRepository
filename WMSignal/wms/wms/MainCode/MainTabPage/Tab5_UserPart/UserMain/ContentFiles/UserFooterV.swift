//
//  UserFooterV.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/13.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class UserFooterV: UICollectionViewCell {
    
    @IBOutlet weak var bton_colorful: UIButton!
    
    var delegate:UserMainDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bton_colorful.gradientLayer(Width: IBScreenWidth*0.9)
        
        setRadiusFor(toview: bton_colorful, radius: 22, lineWidth: 0, lineColor: .clear)
        
        // Initialization code
    }
    
    @IBAction func logoutAction(_ sender: Any) {
//        USERM.setMemberTOKEN(token: "")
        
        self.delegate?.userMainAction(actionType: .Logout)
    }

}
