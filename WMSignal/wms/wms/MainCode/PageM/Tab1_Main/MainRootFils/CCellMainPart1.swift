//
//  CCellMainPart1.swift
//  wms
//
//  Created by Luofei on 2018/4/9.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class CCellMainPart1: UICollectionViewCell {
    
    var delegatePart1:MainPart1Delegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //最新资讯
    @IBAction func actionNews(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 0)
    }
    //法律
    @IBAction func actionFalv(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 1)
    }
    //创投
    @IBAction func actionChuangtou(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 2)
    }
    //税务
    @IBAction func actionShuiwu(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 3)
    }
    //工商
    @IBAction func actionGongshang(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 4)
    }
    //采购
    @IBAction func actionCaigou(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 5)
    }
    //配套
    @IBAction func actionPeitao(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 6)
    }
    //房源
    @IBAction func actionFangyuan(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 7)
    }
    //more
    @IBAction func actionGengduo(_ sender: Any) {
        delegatePart1?.setMainPart1Action(actionType: 8)
    }
    
}
