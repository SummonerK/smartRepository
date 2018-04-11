//
//  WorkSpaceTabC.swift
//  wms
//
//  Created by Luofei on 2018/4/10.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class WorkSpaceTabC: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tabBar.shadowImage = nil
        self.tabBar.backgroundImage = UIImage(named: "background")
        self.tabBar.tintColor = FlatLocalBlack21
        
        let v1 = Tab1Caigou.instantiateInitialViewController()!
        let v2 = Tab2Fenlei.instantiateInitialViewController()!
        let v3 = Tab3ShoppingCar.instantiateInitialViewController()!
        let v4 = TabUser.instantiateInitialViewController()!
        
        let image_main_n = UIImage(named:"caigou")?.withRenderingMode(.alwaysOriginal)
        let image_main_s = UIImage(named:"ic_bgcg_press_03")?.withRenderingMode(.alwaysOriginal)
        
        let image_msg_n = UIImage(named:"fuwu")?.withRenderingMode(.alwaysOriginal)
        let image_msg_s = UIImage(named:"fuwu_")?.withRenderingMode(.alwaysOriginal)
        
        let image_service_n = UIImage(named:"ic_add_shopping_03")?.withRenderingMode(.alwaysOriginal)
        let image_service_s = UIImage(named:"ic_shopping_cart_paress")?.withRenderingMode(.alwaysOriginal)
        
        let image_user_n = UIImage(named:"tab5n")?.withRenderingMode(.alwaysOriginal)
        let image_user_s = UIImage(named:"tab5s")?.withRenderingMode(.alwaysOriginal)
        
        v1.tabBarItem = UITabBarItem.init(title: "办公财办", image: image_main_n, selectedImage: image_main_s)
        v2.tabBarItem = UITabBarItem.init(title: "分类", image: image_msg_n, selectedImage: image_msg_s)
        v3.tabBarItem = UITabBarItem.init(title: "购物车", image: image_service_n, selectedImage: image_service_s)
        v4.tabBarItem = UITabBarItem.init(title: "我的", image: image_user_n, selectedImage: image_user_s)
        
        self.viewControllers = [v1,v2,v3,v4]
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        
        if tabBarController.viewControllers?[3] == viewController || tabBarController.viewControllers?[2] == viewController{
            
//            PrintFM("要加控制咯")
            
//            if USERM.MemberToken != ""{
//
//                return true
//
//            }else{
//
//                LoginAdjust()
//
//                return false
//            }
            
        }
        
        return true
        
    }

}
