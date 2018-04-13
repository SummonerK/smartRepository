//
//  NetManager.swift
//  wms
//
//  Created by Luofei on 2018/4/11.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import Moya
import Alamofire

let basepath = "http://ssapp.sandload.cn"  //api


func jsonToDictionary(jsonString:String) -> [String:Any] {
    
    let jsonData:Data  = jsonString.data(using: .utf8)!
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! [String:Any]
    }
    return NSDictionary() as! [String : Any]
}

enum NETManager {
    case test(ParamModel:ModelTestPost)//测试http
    case testPost(ParamModel:ModelListPost)//测试http

}

extension Observable{
    func IbMapp() {
        
    }
}

extension NETManager: TargetType {
    
    var baseURL: URL {
        
        return URL(string: basepath)!
        
    }
    
    var path: String {
        switch self {
        case .test(_):
            return ""
        case .testPost(ParamModel: _):
            return ""
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        PrintFM("parameterEncoding")
        switch self {
        case .testPost:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .testPost:
            return .post
        default:
            return .get
        }
    }
    
    
    var parameters: [String: Any]? {
        switch self {
        case .test(let model):
            PrintFM(model.toDict())
            return model.toDict()
        case .testPost(let model):
            PrintFM(model.toDict())
            return model.toDict()
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return "API successfully".data(using: .utf8)!
        }
        
    }
    
    // MARK: URLRequestConvertible
    //组织表单
    
    
    
    var task: Task {
        
        switch self {
        case .testPost(let model):
            
//            let strData = model.phone.data(using: .utf8)
//            let formData1 = MultipartFormData(provider: .data(strData!), name: "phone")
//            //数字
//            let intData = String(value2).data(using: .utf8)
//            let formData2 = MultipartFormData(provider: .data(intData!), name: "value2")
            //需要上传的文件
            
            let file1URL = Bundle.main.url(forResource: "hangge", withExtension: "png")!
            let file1Data = try! Data(contentsOf: file1URL)
////文件1
            let formData3 = MultipartFormData(provider: .data(file1Data), name: "file1",
                                            fileName: "png", mimeType: "image/png")
//            let file2URL = Bundle.main.url(forResource: "h", withExtension: "png")!
////文件2
//            let formData4 = MultipartFormData(provider: .file(file2URL), name: "file2",
//                                              fileName: "h.png", mimeType: "image/png")
            let multipartData = [formData3]
            return .upload(.multipart(multipartData))
            
        default:
            return .request
        }
        
    }
    
    
    
    
}







