//
//  YFSessionModel.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/11/1.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

//enum ContentSource{
//    case send
//    case receive
//}
//
//enum ContentType{
//    case text
//    case image
//    case voice
//}

class YFSessionModel: NSObject {
    
    var userImage:String?
    var content:String?
    var contentType:Int?
    var contentSource:Int?
    var width:Int?
    var height:Int?
    
    init(dict:[String:Any]) {
        super.init()
        
        userImage=dict["userImage"] as? String
        content=dict["content"] as? String
        contentType=dict["contentType"] as? Int
        contentSource=dict["contentSource"] as? Int
        width = dict["width"] as? Int
        height=dict["height"] as? Int
    }
    
}

