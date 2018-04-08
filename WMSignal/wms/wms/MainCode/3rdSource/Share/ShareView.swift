//
//  ShareView.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2018/3/2.
//  Copyright © 2018年 FreeMud. All rights reserved.
//

import UIKit

class ShareView: UIView {

    @IBOutlet weak var viewContent: UIView!
    
    var shareSecurity:shareMent? = nil
    
    func showShareView(rootview:UIView,shareItem:shareMent) {
        
        shareSecurity = shareItem
        
        rootview.addSubview(self)
        
        UIView.animate(withDuration: 0.3, animations: { 
    
            self.alpha = 1
            
        })
        
    }
    
    func hidenSharView() {
        UIView.animate(withDuration: 0.3, animations: { 
            self.alpha = 0
        }) { (completion:Bool) in
            self.removeFromSuperview()
        }
    }
    
    @IBAction func shareViewHiden(_ sender: Any) {
        hidenSharView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.alpha = 0
    }
    
    @IBAction func shareWXFriend(_ sender: Any) {
        ShareManager.shareAppToFriend(shareItem: shareSecurity!)
    }

    @IBAction func shareWXCircle(_ sender: Any) {
        ShareManager.shareAppToCircle(shareItem: shareSecurity!)
    }
    
}
