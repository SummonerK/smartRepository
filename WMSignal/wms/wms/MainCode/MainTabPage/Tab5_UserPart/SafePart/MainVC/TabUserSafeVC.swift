//
//  TabUserSafeVC.swift
//  wms
//
//  Created by Luofei on 2018/4/11.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class TabUserSafeVC: UIViewController {
    
    @IBOutlet weak var view_safeLevel: UIView!
    @IBOutlet weak var label_fafeLevel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setRadiusFor(toview: view_safeLevel, radius: 2, lineWidth: 0, lineColor: .clear)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func mimaAction(_ sender: Any) {
        PrintFM("")
    }
    
    @IBAction func shoujiAction(_ sender: Any) {
        PrintFM("")
    }
    
    @IBAction func youxiangAction(_ sender: Any) {
        PrintFM("")
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
