//
//  AboutUSVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/23.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

class AboutUSVC: UIViewController {
    
    @IBOutlet weak var imageV:UIImageView!
    
    @IBOutlet weak var labelVeision:UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadiusFor(toview: imageV, radius: 5, lineWidth: 0, lineColor: UIColor.clear)
        
        if let dic = Bundle.main.infoDictionary{
            if let str : String = dic["CFBundleShortVersionString"] as? String {
                labelVeision.text = "v" + str
            }
        }

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
