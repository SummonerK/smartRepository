//
//  LaunchBVC.swift
//  wms
//
//  Created by Luofei on 2018/4/8.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

import RxSwift
import ObjectMapper
import SwiftyJSON

class LaunchBVC: UIViewController{
    
    @IBOutlet weak var imageVHolder: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageVHolder.image = BundlePngWithName("postHolder")!
        
        showBanner(Str: "https:")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func showBanner(Str:String){
        
        SplashView.updateSplashData(Str, actUrl: "")
        
        SplashView.showSplashView(defaultImage: BundlePngWithName("postHolder")!,tapSplashImageBlock: {(actionUrl) -> Void in
            print("splash image taped, actionUrl optional: \(String(describing: actionUrl))")
        },splashViewDismissBlock: { (initiativeDismiss) in
            print("splash view dismissed, initiativeDismiss optional: \(initiativeDismiss)")
            
            UIApplication.shared.keyWindow?.rootViewController = MainTabC()
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
            
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
