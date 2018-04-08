//
//  Arrays.swift
//  banshengyuan-jishi
//
//  Created by 舒圆波 on 17/11/27.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import Foundation

extension Array {
    func getNewArryFromIndex(fromIndex:Int = 0,toIndex: Int) -> [Element] {
        var newArray: [Element] = []
        for index in fromIndex...toIndex {
            newArray.append(self[index])
        }
        return newArray
    }
}
