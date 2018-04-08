//
//  CCellUserPartshiji.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/27.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class CCellUserPartshiji: UICollectionViewCell {

    @IBOutlet weak var imageVCover: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.backgroundColor = AnyColor(alpha: 0.6)
        
        imageVCover.image = createImageWithColor(color: AnyColor(alpha: 0.6))
        
        setRadiusFor(toview: imageVCover, radius: 5, lineWidth: 0, lineColor: .clear)

        // Initialization code
    }

}
