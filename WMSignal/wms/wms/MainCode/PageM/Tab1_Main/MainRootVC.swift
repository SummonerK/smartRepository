//
//  MainRootVC.swift
//  wms
//
//  Created by Luofei on 2018/4/8.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class MainRootVC: UIViewController {
    
    let arrayValues = [("ic_bgcg","办公采购"),("ic_rcht","日常合同审核"),("ic_hyfw","会议服务")]
    
    @IBOutlet weak var view_search: UIView!
    
    @IBOutlet weak var CVMain:UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadiusFor(toview: view_search, radius: 16, lineWidth: 0, lineColor: .clear)

        setContentView()
    }
    
    func setContentView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        flowLayout.minimumLineSpacing = 1
        
        flowLayout.minimumInteritemSpacing = 1
        
        CVMain.backgroundColor = FlatLightWhiteF1
        
        CVMain.collectionViewLayout = flowLayout
        CVMain.register(UINib.init(nibName: "CCellMainPart1", bundle: nil), forCellWithReuseIdentifier: "CCellMainPart1")
        CVMain.register(UINib.init(nibName: "CCellMainPart2", bundle: nil), forCellWithReuseIdentifier: "CCellMainPart2")
        CVMain.register(UINib.init(nibName: "CCellMainPart3", bundle: nil), forCellWithReuseIdentifier: "CCellMainPart3")
        CVMain.register(UINib.init(nibName: "CCellMainPart4", bundle: nil), forCellWithReuseIdentifier: "CCellMainPart4")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MainRootVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        return CGSize.init(width: IBScreenWidth, height: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        switch indexPath.section{
        case 0:
            return CGSize.init(width: IBScreenWidth, height: IBScreenWidth + 74)
        case 1:
            return CGSize.init(width: (IBScreenWidth-2)/3, height: IBScreenWidth/3)
        case 2:
            return CGSize.init(width: (IBScreenWidth-1)/2, height: 60)
        case 3:
            return CGSize.init(width: IBScreenWidth, height: 81)
        default:
            return CGSize.init(width: IBScreenWidth, height: 0)
        }
    }
    
}

extension MainRootVC:MainPart1Delegate{
    func setMainPart1Action(actionType:Int){
        switch actionType {
        case 0:
            print("最新资讯")
            break
        case 1:
            print("法律")
            break
        case 2:
            print("创投")
            break
        case 3:
            print("税务")
            break
        case 4:
            print("工商")
            break
        case 5:
            print("采购")
            break
        case 6:
            print("配套")
            break
        case 7:
            print("房源")
            break
        case 8:
            print("more")
            break
        default:
            print("default")
        }
        
    }
}

extension MainRootVC:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 8
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellMainPart1", for: indexPath) as! CCellMainPart1
            
            cell.delegatePart1 = self
            
            return cell
            
        case 1:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellMainPart2", for: indexPath) as! CCellMainPart2
            
            cell.imageV_icon.image = UIImage.init(named: arrayValues[indexPath.row].0)
            cell.label_title.text = arrayValues[indexPath.row].1
            
            return cell
            
        case 2:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellMainPart3", for: indexPath) as! CCellMainPart3
            
            cell.label_title.text = "PP苹果"
            cell.label_subtitle.text = "PP苹果"
            
            return cell
        case 3:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellMainPart4", for: indexPath) as! CCellMainPart4

            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellMainPart1", for: indexPath) as! CCellMainPart1
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if indexPath.section == 1{
            switch indexPath.row{
            case 0:
                print("part2 办公采购")
            case 1:
                print("part2 日常合同审核")
            case 2:
                print("part2 会议服务")
            default:
                print("part2 default")
            }
            
        }
        
    }
    
}
