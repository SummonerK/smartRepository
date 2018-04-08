//
//  IBConst.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/22.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import Foundation
import UIKit
import ImageIO
import MBProgressHUD
import SVProgressHUD

// keyWindow
let KeyWindow : UIWindow = UIApplication.shared.keyWindow!

// MARK:封装的日志输出功能（T表示不指定日志信息参数类型）
func PrintFM<T>(_ message:T, file:String = #file, function:String = #function,
             line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("☆☆【☆】\(fileName)\t【☆】ATLine:\(line)\t【☆】\(function)\n【☆】LOG:\(message)")
    #endif
}

///根据颜色获取图片
func createImageWithColor(color: UIColor) -> UIImage
{
    let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return theImage!
}

func HUDShowMsgQuick(msg:String,toView:UIView,time:Float){
    
    let hud = MBProgressHUD.showAdded(to: toView, animated: true)
    hud.mode = MBProgressHUDMode.text
    hud.label.text = msg
    hud.tintColor = UIColor.clear
    //延迟隐藏
    hud.hide(animated: true, afterDelay: TimeInterval(time))
}


///-纯文本提示
func HUDtextShow(toview:UIView ,msg:String ,subMsg:String){
    let hud = MBProgressHUD.showAdded(to: toview, animated: true)
    hud.mode = MBProgressHUDMode.text
    hud.label.text = msg
    hud.detailsLabel.text = subMsg
    //延迟隐藏
    hud.hide(animated: true, afterDelay: 1.5)
}

func HUDGifCustomShow(){
    
    let hud = MBProgressHUD.showAdded(to: KeyWindow, animated: true)
    
    hud.backgroundView.color = UIColor(red: 179.0/255.0, green: 179.0/255.0, blue: 179.0/255.0, alpha: 0.6)
    hud.mode = MBProgressHUDMode.customView
    
    let gifimage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    gifimage.image = UIImage.gifImage(data: HUDGIFData as NSData)
    gifimage.contentMode = .scaleAspectFit
    
    hud.customView = gifimage
    
    hud.bezelView.color = UIColor.white
    hud.bezelView.style = .blur
    hud.animationType = MBProgressHUDAnimation.fade
    
    //延迟隐藏
//    hud.hide(animated: true, afterDelay:1.2)
}

func SVGifHUDShow() {
    
//    let gifimage = UIImageView()
    
    let image = UIImage.gifImage(data: HUDGIFData as NSData)
    
    SVProgressHUD.setBackgroundColor(UIColor.white)

    SVProgressHUD.show(image, status: nil)
    
//    SVProgressHUD.show()
}

/// 测试剪切板，实现代码拷贝内容
func PasteBoard(str:String) {
    
    //就这两句话就实现了
    let paste = UIPasteboard.general
    paste.string = str
    
}
/// 系统打电话
func IBCall(phone:String) {
    HUDShowMsgQuick(msg: phone, toView: KeyWindow, time: 0.8)
    let phoneStr = String.init(format: "tel://%@", phone)
    UIApplication.shared.openURL(URL(string: phoneStr)!)
}

extension Float{
    
    func fixTicket() -> String{
        let formatter = NumberFormatter()
        let format = NSMutableString(string: "###,##0")
        let precision = 0
        if(precision == 0){
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: self))!
            
        }else{
            for _ in 1...precision
            {
                format.appendFormat("0")
            }
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: self))!
        }
    }
    
    
    func fixZheString() -> String {
        
        let acount:Float = self
        
        if acount == 0 || acount < 0 {
            return "0"
        }
        
        if acount*100 >= 100 {
            return "\(String(format: "。。"))"
        }
        
        return "\(String(format: "%.1f", (acount*10)))"
    }
}

//let Sourcebundle = Bundle.main.path(forResource: "Source", ofType: "bundle")
//let path = Bundle(path: Sourcebundle!)?.path(forResource: "loading", ofType: "gif")
//let HUDGIFData = try! Data(contentsOf: URL(fileURLWithPath: path!))

let HUDGIFData = try! Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "loading", ofType: "gif")!))

extension UIImage {
    static func gifImageArray(data: NSData) -> [UIImage] {
        let source = CGImageSourceCreateWithData(data, nil)!
        let count = CGImageSourceGetCount(source)
        if count <= 1 {
            return [UIImage(data: data as Data)!]
        } else {
            var images = [UIImage]();   images.reserveCapacity(count)
            for i in 0..<count {
                let image = CGImageSourceCreateImageAtIndex(source, i, nil)!
                images.append(UIImage(cgImage: image) )
            }
            return images;
        }
    }
    
    static func gifImage(data: NSData) -> UIImage? {
        let gif = gifImageArray(data: data)
        if gif.count <= 1 {
            return gif[0]
        } else {
            return UIImage.animatedImage(with: gif, duration: TimeInterval(gif.count) * 0.1)
        }
    }
    
}


