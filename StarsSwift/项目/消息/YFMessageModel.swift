//
//  YFMessageModel.swift
//  StarsSwift
//
//  Created by 李永飞 on 2017/10/31.
//  Copyright © 2017年 李永飞. All rights reserved.
//

import UIKit

class YFMessageModel: NSObject {
    var userImage:String?
    @objc  var userName:String?
    var date:String?
    var introduction:String?
    var messageCount:String?
   
    init(dict:[String:Any]) {
        super.init()
        
        userImage=dict["userImage"] as? String
        userName=dict["userName"] as? String
        date=dict["date"] as? String
        introduction=dict["introduction"] as? String
        messageCount=dict["messageCount"] as? String
        
    }
    
   
    
}
