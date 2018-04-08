//
//  SexChangeVC.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/11/21.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import UIKit

typealias sexBack =  (_ back:String) -> Void

class SexChangeVC: UIViewController {

    var sexBack:sexBack?
    
    var sexChoose:String?
    
    //渐变颜色
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var bton_man: UIButton!
    
    @IBOutlet weak var bton_woman: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //渐变颜色
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: IBScreenWidth, height: 50)
        //设置渐变的主颜色（可多个颜色添加）
        gradientLayer.colors = [FlatlightYellow.cgColor, FlatYellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        //将gradientLayer作为子layer添加到主layer上
        
        if let nick = sexChoose {
            if nick == "1" {
                bton_man.layer.insertSublayer(gradientLayer, at: 0)
//                bton_man.layer.addSublayer(gradientLayer)
            }
            
            if nick == "2" {
                bton_woman.layer.insertSublayer(gradientLayer, at: 0)
//                bton_woman.layer.addSublayer(gradientLayer)
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if let nick = sexChoose{
            sexBack!(nick)
            self.navigationController?.popViewController(animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }

    }
    
    
    func actionSave(_ sender: Any) {
        sexBack!(sexChoose!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chooseMan(_ sender: Any) {
        PrintFM("choose")
        sexChoose = "1"
        fixLayer()
    }

    
    @IBAction func chooseWoman(_ sender: Any) {
        PrintFM("choose")
        sexChoose = "2"
        fixLayer()
    }
    
    
    func fixLayer() {
        
        gradientLayer.removeFromSuperlayer()
        
        if sexChoose == "1" {
            bton_man.layer.insertSublayer(gradientLayer, at: 0)
//            bton_man.layer.addSublayer(gradientLayer)
        }
        
        if sexChoose == "2" {
            bton_woman.layer.insertSublayer(gradientLayer, at: 0)
//            bton_woman.layer.addSublayer(gradientLayer)
        }
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
