//
//  Views.swift
//  banshengyuan-jishi
//
//  Created by Luofei on 2017/9/22.
//  Copyright © 2017年 FreeMud. All rights reserved.
//

import Foundation
import UIKit

/// 屏幕高度
let IBScreenHeight = UIScreen.main.bounds.size.height
/// 屏幕宽度
let IBScreenWidth = UIScreen.main.bounds.size.width

//MARK:-设置阴影
func setshadowFor(aview:UIView, OffSet:CGSize){
    aview.layer.shadowColor = UIColor.init(red: 125.0/255.0, green: 125.0/255.0, blue: 125.0/255.0, alpha: 1).cgColor
    aview.layer.shadowOpacity = 0.7
    aview.layer.shadowRadius = 2
    aview.layer.shadowOffset = OffSet
}

//MARK:-设置圆角
func setRadiusFor(toview:UIView,radius:CGFloat,lineWidth:CGFloat,lineColor:UIColor){
    toview.layer.cornerRadius = radius
    toview.layer.borderColor = lineColor.cgColor
    toview.layer.borderWidth = lineWidth
    toview.layer.masksToBounds = true
}

//MARK:-设置毛玻璃
func setBlurFor(toview:UIView){
   
    let blurEffect = UIBlurEffect(style: .extraLight)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.alpha = 0.9
    blurView.frame.size = CGSize.init(width: toview.frame.width, height: toview.frame.height)
    toview.addSubview(blurView)
}

func LoginAdjust(){
    
    if USERM.MemberToken == ""{
        
        let Vc = StoryBoard_Login.instantiateViewController(withIdentifier: "LoginNaviC") as! LoginNaviC
        
        UIApplication.shared.keyWindow?.rootViewController?.present(Vc, animated: true, completion: nil)
    }
    
}
//抖动方向枚举
public enum ShakeDirection: Int {
    case horizontal  //水平抖动
    case vertical  //垂直抖动
}

extension UIView {
    
    // MARK: - 常用位置属性
    public var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var viewWidth:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var viewHeight:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.left + self.viewWidth
        }
    }
    
    public var bottom:CGFloat {
        get {
            return self.top + self.viewHeight
        }
    }
    
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
    
    /**
     扩展UIView增加抖动方法
     
     @param direction：抖动方向（默认是水平方向）
     @param times：抖动次数（默认5次）
     @param interval：每次抖动时间（默认0.1秒）
     @param delta：抖动偏移量（默认2）
     @param completion：抖动动画结束后的回调
     */
    public func shake(direction: ShakeDirection = .horizontal, times: Int = 5,
                      interval: TimeInterval = 0.1, delta: CGFloat = 2,
                      completion: (() -> Void)? = nil) {
        //播放动画
        UIView.animate(withDuration: interval, animations: { () -> Void in
            switch direction {
            case .horizontal:
                self.layer.setAffineTransform( CGAffineTransform(translationX: delta, y: 0))
                break
            case .vertical:
                self.layer.setAffineTransform( CGAffineTransform(translationX: 0, y: delta))
                break
            }
        }) { (complete) -> Void in
            //如果当前是最后一次抖动，则将位置还原，并调用完成回调函数
            if (times == 0) {
                UIView.animate(withDuration: interval, animations: { () -> Void in
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                }, completion: { (complete) -> Void in
                    completion?()
                })
            }
                //如果当前不是最后一次抖动，则继续播放动画（总次数减1，偏移位置变成相反的）
            else {
                self.shake(direction: direction, times: times - 1,  interval: interval,
                           delta: delta * -1, completion:completion)
            }
        }
    }
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        print("\(self.bounds)")
        maskLayer.path = maskPath.cgPath
        
        
        self.layer.mask = maskLayer
    }
    
    func gradientLayer(Width:CGFloat){
        //渐变颜色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: Width, height: IBScreenHeight)
        //设置渐变的主颜色（可多个颜色添加）
        gradientLayer.colors = [FlatlightYellow.cgColor, FlatYellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        //将gradientLayer作为子layer添加到主layer上
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //view 设置背景图片 铺开
    func setViewBackgroudImage(image: UIImage) {
        self.layoutIfNeeded()
        UIGraphicsBeginImageContext(self.frame.size)
        image.draw(in: self.bounds)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.backgroundColor = UIColor(patternImage: img)
    }
    
}

///从bundle 中获取图片
let IBImageWithName: (String) -> UIImage? = {imageName in
    return UIImage(named: imageName);
}

let BundleImageWithName:(String) ->UIImage? = {imageName in
    
    if let str = Bundle.main.path(forResource: "Source", ofType: "bundle") , let filePath = Bundle(path: str)?.path(forResource: imageName, ofType: "jpg"){
        return UIImage(contentsOfFile: filePath)
    }else{
        return createImageWithColor(color: UIColor.white)
    }
    
}

let BundlePngWithName:(String) ->UIImage? = {imageName in
    
    if let str = Bundle.main.path(forResource: "Source", ofType: "bundle") , let filePath = Bundle(path: str)?.path(forResource: imageName, ofType: "png"){
        return UIImage(contentsOfFile: filePath)
    }else{
        return createImageWithColor(color: UIColor.white)
    }
    
}

extension UIView {
    func createGradientLayer(colors:[CGColor],_ startPoint: CGPoint = CGPoint(x: 0, y: 0)
        ,_ endPoint: CGPoint = CGPoint(x: 1, y: 0)) {
        self.layoutIfNeeded()
        self.backgroundColor = UIColor.clear
        
        let mGradientLayer:CAGradientLayer = CAGradientLayer()
        
        mGradientLayer.frame = self.bounds
        //设置渐变的主颜色
        mGradientLayer.colors = colors
        mGradientLayer.startPoint = startPoint
        mGradientLayer.endPoint = endPoint
        //将gradientLayer作为子layer添加到主layer上
        self.layer.insertSublayer(mGradientLayer, at: 0)
    }
}

extension UIImageView{
    
    func IBSetImage(withPath:String) {
        self.kf.setImage(with: URL(string: withPath), placeholder: createImageWithColor(color: FlatLightWhiteF1), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    func IBSetBurImage(withPath:String) {
        
        let imageV = UIImageView.init()
        
        imageV.kf.setImage(with: URL(string: withPath), placeholder: createImageWithColor(color: FlatLightWhiteF1), options: nil, progressBlock: nil, completionHandler: {image, error, cacheType, imageURL in
            
            if image != nil{
                self.image = image?.GaosiBurImage
            }
            
        })

    }
    
}


let level = 3

extension UIImage{
    // 模糊图片
    //增加模糊的效果（需要添加Accelerate.Framework）
    var GaosiBurImage:UIImage{
        
        let tempLevel = level
        let context = CIContext(options: nil)

        //获取原始图片
        let inputImage =  CIImage(image: self)
        //使用高斯模糊滤镜
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        //设置模糊半径值（越大越模糊）
        filter.setValue(tempLevel, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: self.size)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        //显示生成的模糊图片
        return UIImage(cgImage: cgImage!)
    }
    
    ///对指定图片进行拉伸
    func resizableImage(name: String) -> UIImage {
        
        var normal = UIImage(named: name)!
        let imageWidth = normal.size.width * 0.5
        let imageHeight = normal.size.height * 0.5
        normal = resizableImage(withCapInsets: UIEdgeInsetsMake(imageHeight, imageWidth, imageHeight, imageWidth))
        
        return normal
    }
    
    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 压缩后最大字节大小
     *
     *  return 压缩后图片的二进制
     */
    func compressImage(image: UIImage, maxLength: Int) -> NSData? {
        
        let newSize = self.scaleImage(image: image, imageLength: 300)
        let newImage = self.resizeImage(image: image, newSize: newSize)
        
        var compress:CGFloat = 0.9
        var data = UIImageJPEGRepresentation(newImage, compress)
        
        while (data?.count)! > maxLength && compress > 0.01 {
            compress -= 0.02
            data = UIImageJPEGRepresentation(newImage, compress)
        }
        
        return data! as NSData
    }
    
    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 150
     *
     *  return 压缩后图片
     */
    func compressImage() -> UIImage {
        
        let newSize = self.scaleImage(image: self, imageLength: 150)
        let newImage = self.resizeImage(image: self, newSize: newSize)
        
        return newImage
    }
    
    
    /**
     *  通过指定图片最长边，获得等比例的图片size
     *
     *  image       原始图片
     *  imageLength 图片允许的最长宽度（高度）
     *
     *  return 获得等比例的size
     */
    func  scaleImage(image: UIImage, imageLength: CGFloat) -> CGSize {
        
        var newWidth:CGFloat = 0.0
        var newHeight:CGFloat = 0.0
        let width = image.size.width
        let height = image.size.height
        
        if (width > imageLength || height > imageLength){
            
            if (width > height) {
                
                newWidth = imageLength;
                newHeight = newWidth * height / width;
                
            }else if(height > width){
                
                newHeight = imageLength;
                newWidth = newHeight * width / height;
                
            }else{
                
                newWidth = imageLength;
                newHeight = imageLength;
            }
            
        }
        return CGSize(width: newWidth, height: newHeight)
    }
    
    /**
     *  获得指定size的图片
     *
     *  image   原始图片
     *  newSize 指定的size
     *
     *  return 调整后的图片
     */
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}


