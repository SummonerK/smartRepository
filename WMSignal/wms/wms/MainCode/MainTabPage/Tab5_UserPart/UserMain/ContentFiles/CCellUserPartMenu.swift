//
//  CCellUserPartMenu.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/27.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class CCellUserPartMenu: UICollectionViewCell {
    @IBOutlet weak var imageVIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.backgroundColor = AnyColor(alpha: 0.6)
        
        imageVIcon.image = createImageWithColor(color: AnyColor(alpha: 0.6))
        
        // Initialization code
    }

}
