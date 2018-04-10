//
//  NameChangeVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/21.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

typealias nickNameBack =  (_ back:String) -> Void

class NameChangeVC: UIViewController {

    var nickNameBack:nickNameBack?
    
    @IBOutlet weak var tf_nickName: UITextField!
    
    var nickName:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        
        if let nick = nickName {
            tf_nickName.text = nick
        }
        
        super.viewDidLoad()
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if let editname = tf_nickName.text {
            nickNameBack!(editname)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func actionSave(_ sender: Any) {
        
        if let editname = tf_nickName.text {
            nickNameBack!(editname)
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
