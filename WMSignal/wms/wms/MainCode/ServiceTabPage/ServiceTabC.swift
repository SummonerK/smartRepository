//
//  ServiceTabC.swift
//  wms
//
//  Created by Luofei on 2018/4/10.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class ServiceTabC: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tabBar.shadowImage = nil
        self.tabBar.backgroundImage = UIImage(named: "background")
        self.tabBar.tintColor = FlatLocalBlack21
        
        let v1 = Tab1Falv.instantiateInitialViewController()!
        let v2 = Tab2Chuangtou.instantiateInitialViewController()!
        let v3 = Tab3Shuiwu.instantiateInitialViewController()!
        let v4 = Tab4Gongshang.instantiateInitialViewController()!
        let v5 = TabUser.instantiateInitialViewController()!
        
        let image_main_n = UIImage(named:"tab1n")?.withRenderingMode(.alwaysOriginal)
        let image_main_s = UIImage(named:"tab1s")?.withRenderingMode(.alwaysOriginal)
        
        let image_msg_n = UIImage(named:"tab2n")?.withRenderingMode(.alwaysOriginal)
        let image_msg_s = UIImage(named:"tab2s")?.withRenderingMode(.alwaysOriginal)
        
        let image_service_n = UIImage(named:"tab3n")?.withRenderingMode(.alwaysOriginal)
        let image_service_s = UIImage(named:"tab3s")?.withRenderingMode(.alwaysOriginal)
        
        let image_zone_n = UIImage(named:"tab4n")?.withRenderingMode(.alwaysOriginal)
        let image_zone_s = UIImage(named:"tab4s")?.withRenderingMode(.alwaysOriginal)
        
        let image_user_n = UIImage(named:"tab5n")?.withRenderingMode(.alwaysOriginal)
        let image_user_s = UIImage(named:"tab5s")?.withRenderingMode(.alwaysOriginal)
        
        v1.tabBarItem = UITabBarItem.init(title: "法律", image: image_main_n, selectedImage: image_main_s)
        v2.tabBarItem = UITabBarItem.init(title: "创投", image: image_msg_n, selectedImage: image_msg_s)
        v3.tabBarItem = UITabBarItem.init(title: "税务", image: image_service_n, selectedImage: image_service_s)
        v4.tabBarItem = UITabBarItem.init(title: "工商", image: image_zone_n, selectedImage: image_zone_s)
        v5.tabBarItem = UITabBarItem.init(title: "我的", image: image_user_n, selectedImage: image_user_s)
        
        self.viewControllers = [v1,v2,v3,v4,v5]
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        
        if tabBarController.viewControllers?[3] == viewController || tabBarController.viewControllers?[2] == viewController{
            
            PrintFM("要加控制咯")
            
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
