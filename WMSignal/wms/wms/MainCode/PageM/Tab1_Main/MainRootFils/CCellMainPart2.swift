//
//  CCellMainPart2.swift
//  wms
//
//  Created by Luofei on 2018/4/9.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class CCellMainPart2: UICollectionViewCell {
    
    @IBOutlet weak var imageV_icon: UIImageView!
    @IBOutlet weak var label_title: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setRadiusFor(toview: imageV_icon, radius: 33, lineWidth: 0, lineColor: .clear)
        
        // Initialization code
    }

}
