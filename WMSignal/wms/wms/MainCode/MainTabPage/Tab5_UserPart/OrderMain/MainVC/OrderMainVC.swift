//
//  OrderMainVC.swift
//  wms
//
//  Created by Luofei on 2018/4/10.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

let underLineWidth = 44
let space = 6

class OrderMainVC: UIViewController {
    
    var scrollVMain: UIScrollView!
    
    @IBOutlet weak var collectionView_top: UICollectionView!
    
    var arrayStatusReader:[(name:String,pageStatus:Int)] = [("办公服务",0),("办公采购",0),("办公配套",0),("房源",0)]
    var ItemW:Int = 0
    let contentHeight = IBScreenHeight-64-45
    var view_undleLine: UIView!
    
    var coverNVC0:OrderFuwuVC?
    
    var tapTop = false
    
    var Page:Int = 33{
        
        didSet{
            
            collectionView_top.reloadData()
//            if arrayStatusReader[Page].pageStatus == 0 {
//                //                记录刷新状态
//                //                arrayStatusReader[Page].pageStatus = 1
//                
//                switch Page {
//                case 0:
//                    coverNVC0?.LoadOrderListData(Status: 0)
//                case 1:
//                    coverNVC1?.LoadOrderListData(Status: 1)
//                case 2:
//                    coverNVC2?.LoadOrderListData(Status: 2)
//                case 3:
//                    coverNVC3?.LoadOrderListData(Status: 3)
//                default:
//                    PrintFM("default")
//                }
//                
//            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numPreRow = arrayStatusReader.count
        ItemW = (Int(IBScreenWidth*0.9))/numPreRow
        
        setupCollectionView()
        setScrollViewMain()
        
        Page = 0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //    设置标题silider
    func setupCollectionView() {
        
        // 1.自定义 Item 的FlowLayout
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        // 4.设置 Item 的四周边距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        // 5.设置同一竖中上下相邻的两个 Item 之间的间距
        flowLayout.minimumLineSpacing = 0
        // 6.设置同一行中相邻的两个 Item 之间的间距
        flowLayout.minimumInteritemSpacing = 0
        
        collectionView_top.collectionViewLayout = flowLayout
        
        collectionView_top.register(UINib.init(nibName: "CCellFoundTop", bundle: nil), forCellWithReuseIdentifier: "CCellFoundTop")
        
        let width:Int = underLineWidth + space*2
        
        let normalSpace = (ItemW - width)/2
        view_undleLine = UIView.init(frame: CGRect.init(x: CGFloat(normalSpace) + 1, y: CGFloat(42.0), width: CGFloat(width), height: CGFloat(2)))
        
        view_undleLine.backgroundColor = FlatLocalGlod
        
        setRadiusFor(toview: view_undleLine, radius: 2, lineWidth: 0, lineColor: .clear)
        
        collectionView_top.addSubview(view_undleLine)
        
    }
    
    func setScrollViewMain() {
        
        scrollVMain = UIScrollView.init(frame: CGRect.init(x: 0, y: 64 + 45, width: IBScreenWidth, height: contentHeight))
        scrollVMain.delegate = self
        scrollVMain.isPagingEnabled = true
        scrollVMain.showsVerticalScrollIndicator = false
        scrollVMain.showsHorizontalScrollIndicator = false
        scrollVMain.isScrollEnabled = true
//        scrollVMain.sh_scrollViewPopGestureRecognizerEnable = true
        scrollVMain.bounces = false
        self.view.addSubview(scrollVMain)
        
        scrollVMain.contentSize = CGSize.init(width: IBScreenWidth*4, height: contentHeight)
        for num in 0..<4{
            
            switch num {
            case 0:
                coverNVC0 = OrderFuwuVC(nibName: "OrderFuwuVC", bundle: nil)
                coverNVC0?.view.frame = CGRect.init(x: IBScreenWidth*CGFloat(num), y: 0, width: IBScreenWidth, height: contentHeight)
                self.addChildViewController(coverNVC0!)
                scrollVMain.addSubview((coverNVC0?.view)!)
            case 1:
                coverNVC0 = OrderFuwuVC(nibName: "OrderFuwuVC", bundle: nil)
                coverNVC0?.view.frame = CGRect.init(x: IBScreenWidth*CGFloat(num), y: 0, width: IBScreenWidth, height: contentHeight)
                self.addChildViewController(coverNVC0!)
                scrollVMain.addSubview((coverNVC0?.view)!)
            case 2:
                coverNVC0 = OrderFuwuVC(nibName: "OrderFuwuVC", bundle: nil)
                coverNVC0?.view.frame = CGRect.init(x: IBScreenWidth*CGFloat(num), y: 0, width: IBScreenWidth, height: contentHeight)
                self.addChildViewController(coverNVC0!)
                scrollVMain.addSubview((coverNVC0?.view)!)
            case 3:
                coverNVC0 = OrderFuwuVC(nibName: "OrderFuwuVC", bundle: nil)
                coverNVC0?.view.frame = CGRect.init(x: IBScreenWidth*CGFloat(num), y: 0, width: IBScreenWidth, height: contentHeight)
                self.addChildViewController(coverNVC0!)
                scrollVMain.addSubview((coverNVC0?.view)!)
            default:
                PrintFM("")
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension OrderMainVC:UIScrollViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        tapTop = false
    }
    
    func scrollviewScroll(toPage:Int){
        
        Page = toPage
        
        self.tapTop = true
        
        scrollVMain.scrollRectToVisible(CGRect.init(x: CGFloat(toPage) * IBScreenWidth, y: 0, width: IBScreenWidth, height: contentHeight), animated: false)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        
        if scrollView == scrollVMain{
            
            let offsetX = scrollView.contentOffset.x
            
            let page = Int(ceil(offsetX/IBScreenWidth))
            
            let width:Int = underLineWidth + space*2
            
            let normalSpace = (ItemW - width)/2
            
            let paceWidth:CGFloat = CGFloat(ItemW)
            
            self.view_undleLine.frame.origin.x = CGFloat(normalSpace) + offsetX*paceWidth/IBScreenWidth
            
            if page == Page {
                return
            }else{
                
                if !tapTop {
                    
                    Page = page
                }
                
                let indexPath = IndexPath.init(row: page, section: 0)
                
                self.collectionView_top.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
            
        }
        
    }
    
    
}

extension OrderMainVC:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if collectionView == collectionView_top {
            scrollviewScroll(toPage: indexPath.row)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return arrayStatusReader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCellFoundTop", for: indexPath) as! CCellFoundTop
        
        cell.label_txt.text = arrayStatusReader[indexPath.row].name
        
        if indexPath.row == Page {
            cell.label_txt.textColor = FlatLocalGlod
        }else{
            cell.label_txt.textColor = FlatLocalBlack21
        }
        
        return cell
        
    }
    
}


extension OrderMainVC:UICollectionViewDelegateFlowLayout{
    
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize.init(width: ItemW, height: 40)
        
    }
    
}

