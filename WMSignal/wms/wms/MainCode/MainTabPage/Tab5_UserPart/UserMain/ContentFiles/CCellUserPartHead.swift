//
//  CCellUserPartHead.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/27.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class CCellUserPartHead: UICollectionViewCell {
    
    @IBOutlet weak var labelNickName: UILabel!
    @IBOutlet weak var labelNewsNum: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    var delegate:UserMainDelegate?
    
//    var modelUser:modelUserInfo?
//    {
//        didSet{
//            
//            labelNickName.text = modelUser?.name ?? "昵称"
//            labelNewsNum.text = modelUser?.salt ?? "个签"
//            imageV.IBSetImage(withPath: (modelUser?.head_img ?? "http"))
//            
//            
//        }
//    }
    

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
//        self.contentView.backgroundColor = FlatLightWhiteF1
        
        self.contentView.gradientLayer(Width: IBScreenWidth)
        
        imageV.image = createImageWithColor(color: AnyColor(alpha: 0.6))
        
        setRadiusFor(toview: imageV, radius: 65/2, lineWidth: 0, lineColor: .clear)
        
        // Initialization code
    }
    
    @IBAction func noticeVAction(_ sender: Any) {
        
        self.delegate?.userMainAction(actionType: .NoticeV)
    }

}
