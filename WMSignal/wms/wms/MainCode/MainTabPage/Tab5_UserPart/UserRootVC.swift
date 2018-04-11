//
//  UserRootVC.swift
//  wms
//
//  Created by Luofei on 2018/4/8.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class UserRootVC: UIViewController {
    
    @IBOutlet weak var tableViewMain:UITableView!
    
    @IBOutlet weak var view_Navi: UIView!
    
    @IBOutlet weak var label_badge: UILabel!
    
    
    let arrayValues = [("ic_favorite_border_03","我的收藏"),("ic_my_info_03","我的信息"),("ic_mdzj_03","我的足迹"),("ic_aqzx_03","安全中心")]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.backgroundColor = FlatLightWhiteF1
        
        setRadiusFor(toview: label_badge, radius: 10, lineWidth: 0, lineColor: .clear)
        
        tableViewMain.register(UINib.init(nibName: "TCellUserRootHead", bundle: nil), forCellReuseIdentifier: "TCellUserRootHead")
        tableViewMain.register(UINib.init(nibName: "TCellUserRootNormal", bundle: nil), forCellReuseIdentifier: "TCellUserRootNormal")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UserRootVC: UserPart1Delegate{
    
    func setUserPart1Action(actionType:Int){
        switch actionType {
        case 0:
            print("User-订单")
            let Vc = OrderMainVC(nibName: "OrderMainVC", bundle: nil)
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.pushViewController(Vc, animated: true)
            break
        case 1:
            print("User-服务")
            break
        case 2:
            print("User-采购")
            break
        case 3:
            print("User-配套")
            break
        case 4:
            print("User-房源")
            break
        default:
            print("default")
        }
        
    }
}

extension UserRootVC:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TCellUserRootHead", for: indexPath) as! TCellUserRootHead
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell.delegateUser = self
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TCellUserRootNormal", for: indexPath) as! TCellUserRootNormal
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell.imageV_icon.image = UIImage.init(named: arrayValues[indexPath.row].0)
            cell.label_title.text = arrayValues[indexPath.row].1
            if indexPath.row == 3{
                cell.view_line.isHidden = true
            }else{
                cell.view_line.isHidden = false
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TCellUserRootNormal", for: indexPath) as! TCellUserRootNormal
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell.imageV_icon.image = UIImage.init(named: "ic_setting_03")
            cell.label_title.text = "设置"
            cell.view_line.isHidden = true
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TCellUserRootNormal", for: indexPath) as! TCellUserRootNormal
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch indexPath.section {
        case 0:
            return 310
        case 1,2:
            return 44
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                print("收藏")
                let Vc = LikeMainVC(nibName: "LikeMainVC", bundle: nil)
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(Vc, animated: true)
                break
            case 1:
                print("信息")
                let Vc = TabUserInfoVC(nibName: "TabUserInfoVC", bundle: nil)
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(Vc, animated: true)
                break
            case 2:
                print("足迹")
                break
            case 3:
                print("安全中心")
                let Vc = TabUserSafeVC(nibName: "TabUserSafeVC", bundle: nil)
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(Vc, animated: true)
                break
            default:
                print("User—default")
            }
        }
        
        if indexPath.section == 2 {
            print("设置")
            let Vc = TabUserSetVC(nibName: "TabUserSetVC", bundle: nil)
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.pushViewController(Vc, animated: true)
        }
        
    }
    
}
