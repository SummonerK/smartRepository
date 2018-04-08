//
//  Colors.swift
//  BanShengYuan
//
//  Created by Luofei on 2017/6/21.
//  Copyright © 2017年 Luofei. All rights reserved.
//

import Foundation
import UIKit
import DynamicColor

let FlatBlackDark = UIColor(hexString: "#1D1D1D")
let FlatBlackLight = UIColor(hexString: "#202020")
let FlatGrayDark = UIColor(hexString: "#6D797A")
let FlatGrayLight = UIColor(hexString: "#849495")
let FlatWhiteDark = UIColor(hexString: "#B0B6BB")
let FlatWhiteLight = UIColor(hexString: "#E8ECEE")
let FlatLocalMain = UIColor(hexString: "#35BBC6")
let FlatLocalWhite = UIColor(hexString: "#FFFFFF")
let FlatLocalWhitelight = UIColor(hexString: "#85F4F4")
let FlatLocalBlack = UIColor(hexString: "#999999")
let FlatLocalLight = UIColor(hexString: "#EDEDED")
let FlatLocalGray = UIColor(hexString: "#CFCDCD")
let FlatLocalGlod = UIColor(hexString: "#FBC700")

let FlatLightWhiteF1 = UIColor(hexString: "#F1F1F1")
let FlatLocalBlack21 = UIColor(hexString: "#212121")
let FlatLocalRed = UIColor(hexString: "#ff0036")
let FlatlightYellow = UIColor(hexString: "#fffc00")
let FlatYellow = UIColor(hexString: "#fbbc00")
let FlatYellowGoodsGlor = UIColor(hexString: "#ffea00")

let FlatCafeeLight = UIColor(hexString: "#C7B99F")
let FlatCafeeRegular = UIColor(hexString: "#998057")
let FlatYellowShine = UIColor(hexString: "#FFD05E")
let FlatPinkLight = UIColor(hexString: "#FF5B7E")
let FlatGray66 = UIColor(hexString: "#666666")
let FlatGrayaa = UIColor(hexString: "#aaaaaa")

let AnyColor = UIColor.init(hue: (CGFloat(Float(arc4random()%256) / 256.0)), saturation: (CGFloat(Float(arc4random()%256) / 256.0)), brightness: (CGFloat(Float(arc4random()%256) / 256.0)), alpha: 0.6)

func AnyColor(alpha:CGFloat)->UIColor{
    let anycolor = UIColor.init(hue: (CGFloat(Float(arc4random()%256) / 256.0)), saturation: (CGFloat(Float(arc4random()%256) / 256.0)), brightness: (CGFloat(Float(arc4random()%256) / 256.0)), alpha: alpha)
    return anycolor
}
