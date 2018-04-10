//
//  SafeSetVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/21.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit


class SafeSetVC: UIViewController {
    
    var mobile:String?
    
    @IBOutlet weak var label_phone: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_phone.text = mobile

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    ///编辑头像
    @IBAction func pwdEditAction(_ sender: Any) {
        
        PrintFM("")
        
        //注册 - 重设密码页面
        
        let Vc = UResetpwdVC(nibName: "UResetpwdVC", bundle: nil)
        
        self.navigationController?.pushViewController(Vc, animated: true)
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
